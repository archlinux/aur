# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream ships no LICENSE file; the licence text in the tree is the MIT grant
# heading the bundled KANN headers, so that is what gets installed.

pkgname=dna-nn
pkgver=0.1
pkgrel=1
pkgdesc="Deep-learning models for annotating satellite DNA in long assemblies"
arch=('x86_64')
url="https://github.com/lh3/dna-nn"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bac26a25ad9e0315351b170bc33ab4e41b7573818fd9527b661f882b96ae0a8a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 gen-fq "$pkgdir/usr/bin/gen-fq"
    install -Dm755 dna-cnn "$pkgdir/usr/bin/dna-cnn"
    install -Dm755 dna-brnn "$pkgdir/usr/bin/dna-brnn"
    # the pre-trained (ATTCC)n / alpha-satellite model the README uses
    install -Dm644 models/attcc-alpha.knm \
        "$pkgdir/usr/share/$pkgname/models/attcc-alpha.knm"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kann.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
