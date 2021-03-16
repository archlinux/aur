# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributer: Giuseppe Calà <jiveaxe@gmail.com>
# Contributer: giacomogiorgianni@gmail.com
# Contributor: TingPing <tingping@tingping.se>

pkgname=grive
pkgver=0.5.1
pkgrel=3
pkgdesc="An open source Linux client for Google Drive with support for the new Drive REST API and partial sync"
arch=('i686' 'x86_64')
url='https://github.com/vitalif/grive2'
license=('GPL2')
depends=('yajl' 'curl' 'libgcrypt' 'boost-libs' 'gcc-libs' 'json-c' 'expat')
optdepends=("inotify-tools: scheduled syncs and syncs on file change events"
    "cppunit: unit tests"
    "binutils: backtrace and libiberty")
makedepends=('cmake' 'boost')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/vitalif/grive2/archive/v${pkgver}.tar.gz"
	"binutils_compilation.patch"::"https://github.com/vitalif/grive2/commit/b4d6ac055f8f16ac735a70036243bc4ea2334039.patch")
sha512sums=('609837fc93ad78d143dcb4d1f558743d413c887fec2e9aaac81edd58549b812db859aab5ce7f664f06564779cff4bae32d43529e47fcc36640f1a9b52c5b5888'
            'b425c524b28a3e245a4de6090b052a2b1e08a06b5b8227450f91a127d4ea67cc8b1f3a74ac802f1525126d236fa1ad2de0a171ef0fa241ad27b1164606ec0501')

prepare() {
	cd "${srcdir}/${pkgname}2-${pkgver}"

	patch -Np1 -i ../binutils_compilation.patch
}

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
