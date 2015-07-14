# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributor: Tom Moore <tmoore01 at gmail dot com>
# Contributer: Allen Choong <allencch at hotmail dot com>
# Contributer: Andrea Scarpino <andrea@archlinux.org>
# Contributer: Daniel YC Lin <dlin.tw at gmail>
# Contributer: Jarek Sedlacek <JarekSedlacek@gmail>

pkgname=grive-git
pkgver=358.308aab9
pkgrel=1
pkgdesc='An open source Linux client for Google Drive with support for the new Drive REST API and partial sync'
arch=('i686' 'x86_64')
url='https://github.com/vitalif/grive2'
license=('GPL2')
depends=('yajl' 'curl' 'libgcrypt' 'boost-libs' 'gcc-libs' 'json-c' 'expat')
optdepends=("cppunit: unit tests"
			"binutils: backtrace and libiberty")
makedepends=('cmake' 'git' 'boost')
provides=('grive')
conflicts=('grive')
source=("${pkgname}"::"git+https://github.com/vitalif/grive2")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${pkgname}"
    rm -rf build
    mkdir build
    cd build

    cmake .. -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXE_LINKER_FLAGS=-ljson-c

    make
}

package() {
    make -C "${srcdir}/${pkgname}/build" DESTDIR="${pkgdir}" install
}
