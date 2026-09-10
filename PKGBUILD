# Maintainer: bannert <aur@bannert.dev>

pkgname=sudoku-gtk4
pkgver=1.8.0 # renovate: datasource=github-tags depName=sepehr-rs/Sudoku
pkgrel=2
pkgdesc="A modern Sudoku app built with Python, GTK4 and libadwaita"
arch=('any')
url="https://github.com/sepehr-rs/Sudoku"
license=('GPL3')
depends=('python-sudoku-engine' 'python-gobject' 'libadwaita' 'gtk4' 'glib2')
makedepends=('meson' 'ninja' 'blueprint-compiler')
provides=('sudoku-gtk4')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/sepehr-rs/Sudoku/archive/v${pkgver}.tar.gz")
sha256sums=('8593e7deacfccade21f97403913a4f0b726fc2d62973bbf828d472a1123b6246')

prepare() {
	cd "${srcdir}/Sudoku-${pkgver}"
}

build() {
	cd "${srcdir}/Sudoku-${pkgver}"
	meson setup build --prefix=/usr
	ninja -C build
}

package() {
	cd "${srcdir}/Sudoku-${pkgver}"
	DESTDIR="${pkgdir}" ninja -C build install

	# Install documentation
	install -Dm644 COPYING "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
