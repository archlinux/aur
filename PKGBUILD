# Maintainer: bannert <aur@bannert.dev>

pkgname=sudoku-gtk4
pkgver=1.4.0
pkgrel=1
pkgdesc="A modern Sudoku app built with Python, GTK4 and libadwaita"
arch=('any')
url="https://github.com/sepehr-rs/Sudoku"
license=('GPL3')
depends=('python-sudoku-engine' 'python-gobject' 'libadwaita' 'gtk4' 'glib2' 'json-glib')
makedepends=('meson' 'ninja')
provides=('sudoku-gtk4')
source=("https://github.com/sepehr-rs/Sudoku/archive/v${pkgver}.tar.gz")
sha256sums=('d2ece1e4812a01b4557648d2d1bf0b73383f03be79a722c1b3680d52a0680f98')

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
