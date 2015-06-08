# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
pkgname=myrescue
pkgver=0.9.4
pkgrel=1
pkgdesc="A hard disk recovery tool that reads undamaged regions first"
depends=()
arch=('i686' 'x86_64')
license=('GPL')
url="http://myrescue.sourceforge.net/"
source=(
    "http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"
    "myrescue-printf-sizes.diff")
md5sums=('b45fd12e45d5681d3e98dc1134a3a209'
         'd5c6dab0f67682a1d1f757b1ab4df6b2')

build() {
    cd "$srcdir/$pkgname-$pkgver/src"
    patch -p1 < "$srcdir/myrescue-printf-sizes.diff"
    make
}
package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m 755 src/myrescue "$pkgdir"/usr/bin/myrescue
    install -D -m 644 doc/myrescue.1 "$pkgdir"/usr/share/man/man1/myrescue.1
}
