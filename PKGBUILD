# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com
# Contributor: TingPing <tingping@tingping.se>

pkgname=grive
pkgver=0.5.0
pkgrel=7
pkgdesc="An open source Linux client for Google Drive with support for the new Drive REST API and partial sync"
arch=('i686' 'x86_64')
url='https://github.com/vitalif/grive2'
license=('GPL2')
depends=('yajl' 'curl' 'libgcrypt' 'boost-libs' 'gcc-libs' 'json-c' 'expat')
optdepends=("cppunit: unit tests"
	"binutils: backtrace and libiberty")
makedepends=('cmake' 'boost')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz")
sha512sums=('d564d674c4318e156677e919509a8e0f8d92f78ec4a5b250083eb99db572aeacab98def2e0ef65f59d8e1bff268256996e74800ce4ddd036d72fed4af1163085')

build() {
	cd "${srcdir}/${pkgname}2-${pkgver}"
	rm -rf build
	mkdir build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_EXE_LINKER_FLAGS=-ljson-c ..

	make
}

package() {
	make -C "${srcdir}/${pkgname}2-${pkgver}/build" DESTDIR="${pkgdir}" install
}
