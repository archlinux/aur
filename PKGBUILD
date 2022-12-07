# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=yyjson
pkgver=0.5.1
pkgrel=1
pkgdesc="A high performance C JSON library"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://ibireme.github.io/yyjson/"
license=('MIT')
depends=()
makedepends=('cmake')
source=("https://github.com/ibireme/yyjson/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('b484d40b4e20cc3174a6fdc160d0f20f961417f9cb3f6dc1cf6555fffa8359f3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    mkdir -p build && cd build
    cmake \
      -DBUILD_SHARED_LIBS=ON \
      -DCMAKE_BUILD_TYPE=RelWithDebInfo \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      ..

    cmake --build .
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" ../LICENSE
}

# vim:set ts=4 sw=4 et:
