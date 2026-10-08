# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the licence text in the tree is the MIT grant
# heading the bundled klib headers, so that is what gets installed.

pkgname=bgt
pkgver=1.0
pkgrel=1
pkgdesc="Flexible genotype query among 30,000+ whole-genome samples"
arch=('x86_64')
url="https://github.com/lh3/bgt"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('b7dd90569432d34621d2abaa153dc96157ecea66312a317d34bb6174588c4743')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
    make extra
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 bgt "$pkgdir/usr/bin/bgt"
    install -Dm755 pbfview "$pkgdir/usr/bin/pbfview"
    install -Dm755 kexpr "$pkgdir/usr/bin/kexpr"
    install -Dm755 fmf "$pkgdir/usr/bin/fmf"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
