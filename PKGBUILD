# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the only licence text in the tree is the MIT
# grant heading the vendored klib headers, so that is what gets installed.

pkgname=gfatools
pkgver=0.5
pkgrel=1
pkgdesc="Tools for manipulating sequence graphs in the GFA and rGFA formats"
arch=('x86_64')
url="https://github.com/lh3/gfatools"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0653dc143c2224743afb6bb638da3465231ec0bb476c0d55e2eb6708ee105712')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 gfatools "$pkgdir/usr/bin/gfatools"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
