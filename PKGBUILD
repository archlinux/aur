# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.4.2
pkgrel=1
pkgdesc="Support for Microsoft SideWinder X4 / X6 and Logitech G105 / G710+."
arch=('x86_64')
url="http://cevel.net/projects/sidewinderd/"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
sha256sums=('4f79b92118ff5c5da0c093439bf875079f5243e852ecc769888d7d5a53cff62e')
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
