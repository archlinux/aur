# Maintainer: Jurica Bradarić <jbradaric@gmail.com>

pkgname=libluv
pkgver=1.29.1
pkgrel=2
pkgdesc='libuv bindings for luajit and lua 5.1/5.2.'
arch=('i686' 'x86_64')
url='https://github.com/luvit/luv'
license=('apache')
provides=('libluv')
conflicts=()
depends=('luajit' 'libuv')
makedepends=('cmake' 'luajit' 'libuv')
source=('https://github.com/luvit/luv/releases/download/1.29.1-2/luv-1.29.1-2.tar.gz')
sha256sums=('866e6c82f3eb4ae73222b835c7621d1b8f6b4271b5cee8dd00729338cfef9d47')

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
