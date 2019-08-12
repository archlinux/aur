# Maintainer: Jurica Bradarić <jbradaric@gmail.com>

pkgname=libluv
pkgver=1.30.0
pkgrel=0
pkgdesc='libuv bindings for luajit and lua 5.1/5.2.'
arch=('i686' 'x86_64')
url='https://github.com/luvit/luv'
license=('apache')
provides=('libluv')
conflicts=()
depends=('luajit' 'libuv')
makedepends=('cmake' 'luajit' 'libuv')
source=("https://github.com/luvit/luv/releases/download/$pkgver-$pkgrel/luv-$pkgver-$pkgrel.tar.gz")
sha256sums=('5cc75a012bfa9a5a1543d0167952676474f31c2d7fd8d450b56d8929dbebb5ef')

build() {
    mkdir "${srcdir}/build"
    cd "${srcdir}/build"
    cmake -DWITH_SHARED_LIBUV=ON -DLUA_BUILD_TYPE=System \
        -DBUILD_MODULE=OFF -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "${srcdir}/luv-${pkgver}-${pkgrel}"
    make
}

package() {
    cd "${srcdir}/build"
    DESTDIR="${pkgdir}" make install
}

# vim:set ts=2 sw=2 et:
