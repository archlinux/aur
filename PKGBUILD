pkgname=kms-jsoncpp
pkgver=1.6.4
pkgrel=1
pkgdesc="fork of jsoncpp for kms-jsonrpc"
arch=(any)
url="https://github.com/Kurento/jsoncpp"
license=(MIT)
source=("git+https://github.com/Kurento/jsoncpp.git#tag=$pkgver")
sha256sums=(SKIP)

build() {
    local builddir=$srcdir/jsoncpp/build
    rm -rf "$builddir"
    mkdir "$builddir"
    cd "$builddir"
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF ..
    make
}

package() {
    local builddir=$srcdir/jsoncpp/build
    cd "$builddir"
    make install DESTDIR="$pkgdir"
    mkdir "$pkgdir"/usr/include/kmsjsoncpp
    mv "$pkgdir"/usr/include/{json,kmsjsoncpp}
}
