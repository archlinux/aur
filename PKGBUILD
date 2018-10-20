# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

_modulename=appcenter

pkgname=liri-${_modulename}
pkgver=0.1.0
pkgrel=1
pkgdesc="App Center for Liri OS"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://liri.io'
license=('GPL3')
depends=('karchive' 'flatpak')
makedepends=('extra-cmake-modules')
conflicts=('liri-appcenter-git')
groups=('liri')
source=("https://github.com/lirios/${_modulename}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('bc309855f500dc67d996b955fb69feb29255f3e5c6c4c7339480092402c8a4dd')

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${pkgname}-${pkgver} \
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
