# Maintainer: Maxime Arthaud <maxime@arthaud.me>

pkgname=snowman-git
pkgver=0.1.3.r0.gd7dee56c
pkgrel=1
pkgdesc="Native code to C/C++ decompiler (supporting x86, amd64 and arm)"
arch=('any')
url="http://derevenets.com/"
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake' 'boost')
source=("$pkgname::git://github.com/yegord/snowman.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

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
