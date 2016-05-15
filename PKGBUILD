# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com
# Contributor: TingPing <tingping@tingping.se>

pkgname=grive
pkgver=0.5.0
pkgrel=2
pkgdesc="An open source Linux client for Google Drive with support for the new Drive REST API and partial sync"
arch=('i686' 'x86_64')
url='https://github.com/vitalif/grive2'
license=('GPL2')
depends=('yajl' 'curl' 'libgcrypt' 'boost-libs' 'gcc-libs' 'json-c' 'expat')
optdepends=("cppunit: unit tests"
	"binutils: backtrace and libiberty")
makedepends=('cmake' 'boost')
conflicts=('grive-git')
source=("https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz")
md5sums=('f291ffaef831abf3605417995082bcc3')

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
