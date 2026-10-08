# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no library target; the static library is built here from the
# single translation unit. Headers are namespaced to avoid clashing with the
# khash.h and cgranges.h copies shipped by other packages.

pkgname=cgranges
pkgver=0.1.1
pkgrel=1
pkgdesc="Fast interval overlap queries on genomic intervals"
arch=('x86_64')
url="https://github.com/lh3/cgranges"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9445ec0cab97e736981db440cb306069d6fe33f638fbd142c106a0408ba10d6c')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    "${CC:-cc}" $CFLAGS $CPPFLAGS -c cgranges.c -o cgranges.o
    ar rcs libcgranges.a cgranges.o
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 cgranges.h "$pkgdir/usr/include/$pkgname/cgranges.h"
    install -Dm644 khash.h "$pkgdir/usr/include/$pkgname/khash.h"
    install -Dm644 libcgranges.a "$pkgdir/usr/lib/libcgranges.a"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
