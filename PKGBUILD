# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.4.0
pkgrel=2
pkgdesc="Support for Microsoft SideWinder X4 / X6 and Logitech G105 / G710+."
arch=('x86_64')
url="http://cevel.net/projects/sidewinderd/"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
sha256sums=('71f3f99ffa39db0c61a2d178d14889f9f91bef4b4a02e856b347631572e5181e')
backup=('etc/sidewinderd.conf')

prepare() {
	mkdir -p build
	cd ${pkgname}-${pkgver}
}

build() {
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		../${pkgname}-${pkgver}
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
