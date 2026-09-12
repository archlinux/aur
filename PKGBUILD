# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=gencore
pkgver=0.17.2
pkgrel=1
pkgdesc="Generate duplex/single consensus reads to reduce sequencing noise"
arch=('x86_64')
url="https://github.com/OpenGene/gencore"
license=('MIT')
options=('!strip' '!debug')
depends=('glibc' 'zlib' 'htslib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f39f12c38670d93683a5f3f27306c56459a4fd19abcb1a9e3c732b229333aa51')

build() {
    cd "$srcdir/gencore-$pkgver"
    # Headers live in ./src (the Makefile points at a nonexistent ./inc) and
    # the link line (-L. -lhts) resolves to the system htslib.
    make CFLAGS="-std=c++11 -O3 -I./src -I/usr/include"
}

check() {
    cd "$srcdir/gencore-$pkgver"
    ./gencore --version
}

package() {
    cd "$srcdir/gencore-$pkgver"
    install -Dm755 gencore "$pkgdir/usr/bin/gencore"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
