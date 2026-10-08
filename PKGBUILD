# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the licence text in the tree is the MIT grant
# heading the bundled klib headers, so that is what gets installed.

pkgname=hickit
pkgver=0.1.1
pkgrel=1
pkgdesc="TAD calling, phase imputation and 3D modelling for diploid single-cell Hi-C"
arch=('x86_64')
url="https://github.com/lh3/hickit"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d781cb42b34f801c64cc2f21253d92fef42a030c0ce9a6e62f1620c2ea47b04a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 hickit "$pkgdir/usr/bin/hickit"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
