# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_modulename=themes

pkgname=liri-${_modulename}
pkgver=0.9.0
pkgrel=1
pkgdesc="Themes for uniform look and feel throughout Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
makedepends=('extra-cmake-modules')
conflicts=('liri-themes-git')
groups=('liri')
source=("https://github.com/lirios/${_modulename}/releases/download/v${pkgver}/lirios-themes-${pkgver}.tar.xz")
sha256sums=('59ebc01231ebf955fd847db925fca1c557273da126087af2dfe09013321a54b5')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../lirios-themes-${pkgver} \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DKDE_INSTALL_LIBDIR=lib \
		-DKDE_INSTALL_LIBEXECDIR=lib
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
