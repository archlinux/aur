# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.4.4
pkgrel=1
pkgdesc="Support for Microsoft SideWinder X4 / X6 and Logitech G103 / G105 / G710+."
arch=('x86_64')
url="https://github.com/tolga9009/sidewinderd"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
sha256sums=('6637f3c8296b0f99522275f7ebfd9ca379c5ebe0897bb4543693e5ba3ad0989d')
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
