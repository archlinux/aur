# Maintainer: Tolga Cakir <tolga@cevel.net>

pkgname=sidewinderd
pkgver=0.4.3
pkgrel=1
pkgdesc="Support for Microsoft SideWinder X4 / X6 and Logitech G103 / G105 / G710+."
arch=('x86_64')
url="https://github.com/tolga9009/sidewinderd"
depends=('libconfig' 'systemd' 'tinyxml2')
makedepends=('cmake')
license=('MIT')
install=${pkgname}.install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tolga9009/sidewinderd/archive/${pkgver}.tar.gz")
sha256sums=('a8d5dea8d9fb66ba963a453c5760a866fb1c202411da0f80cc8ef4ca427f9215')
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
