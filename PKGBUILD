# Maintainer: drakkan <nicola.murino at gmail dot com>
pkgname=snowman
pkgver=0.1.3
pkgrel=1
_tag=v${pkgver}
pkgdesc="Native code to C/C++ decompiler (supporting x86, amd64 and arm)"
arch=('any')
url="http://derevenets.com/"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake' 'boost')
source=("git+https://github.com/yegord/${pkgname}#tag=${_tag}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    mkdir build
    cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        ../src
}

package() {
    cd "$srcdir/$pkgname/build"
    make DESTDIR="$pkgdir" install
    install -Dm644 "$srcdir"/$pkgname/doc/licenses.asciidoc \
        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
