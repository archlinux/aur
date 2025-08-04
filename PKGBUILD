# Maintainer: goll <goll@users.noreply.github.com>

pkgname=pipemixer
pkgver=0.2.1
pkgrel=1
pkgdesc='TUI volume control app for pipewire'
arch=('x86_64')
url='https://github.com/heather7283/pipemixer'
license=('GPL-3.0-only')
depends=('glibc' 'libpipewire' 'ncurses')
makedepends=('git' 'meson' 'ninja')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/heather7283/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1f89f929962896592159d6882bb4e33ab05cab7487d7f048d7288ec6d0394045')

build() {
	cd "${pkgname}-${pkgver}"
	arch-meson -D system_libraries=disabled build
	meson compile -C build
}

package() {
	cd "${pkgname}-${pkgver}"
	meson install -C build --destdir "${pkgdir}"
}
