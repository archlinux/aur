# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the only licence text in the tree is the MIT
# grant heading the vendored klib headers, so that is what gets installed.

pkgname=sdust
pkgver=0.1
pkgrel=1
pkgdesc="Symmetric DUST for finding low-complexity regions in DNA sequences"
arch=('x86_64')
url="https://github.com/lh3/sdust"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0825a760fae884e65b2b024cc4f511e32e6c1698571c147daf5a61ba0dcac589')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    # the Makefile's -std=c99 hides fileno(); the default gnu dialect declares it
    make CFLAGS="$CFLAGS"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 sdust "$pkgdir/usr/bin/sdust"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
