pkgname=kms-jsonrpc
pkgver=6.13.0
pkgrel=1
pkgdesc="JSON-RPC library for Kurento media server"
arch=(any)
url="https://github.com/Kurento/kms-jsonrpc"
license=(apache)
depends=(boost kms-jsoncpp)
makedepends=(kms-cmake-utils)
source=("git://github.com/Kurento/$pkgname.git#tag=$pkgver")
sha256sums=(SKIP)

build() {
    local builddir=$srcdir/$pkgname/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_MODULE_PATH=/usr/share/cmake/Modules -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
    make
}

package() {
    local builddir=$srcdir/$pkgname/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
}
