# Maintainer: Joe Balough <jbb5044@gmail.com>
pkgname=anjay-git
pkgver=1.3.1
pkgrel=1
pkgdesc="C implementation of the client-side OMA LwM2M protocol, uses mbedtls"
arch=('i686' 'x86_64')
url="https://github.com/AVSystem/Anjay"
license=('Apache')
makedepends=('coreutils' 'cmake' 'mbedtls')
source=('git://github.com/AVSystem/Anjay.git')
md5sums=('SKIP')

pkgver() {
	cd "Anjay"
	git describe --tags | sed 's|-|.|g'
}

build() {
	cd "Anjay"
	git submodule update --init
	cmake .\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DWITH_DEMO=false \
		-DDTLS_BACKEND="mbedtls"
	make -j
}

package() {
	cd "Anjay"
	make "DESTDIR=${pkgdir}" install
}
