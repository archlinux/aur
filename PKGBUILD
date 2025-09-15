# Maintainer: goll <goll@users.noreply.github.com>

pkgname=pipemixer
pkgver=0.2.2
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-only')
depends=('glibc' 'libpipewire' 'ncurses')
makedepends=('git' 'meson' 'ninja')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/heather7283/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('7d43f971754ac1b0ef4e37a7cb008a4f2be9a91297751b74dcaef9cf24a7c3f7')

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson -D system_libraries=disabled build
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	meson install -C build --destdir "${pkgdir}"
}
