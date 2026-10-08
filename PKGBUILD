# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.

pkgname=kmer-map
_tag=4da68464298b1fdd7c9eb148c5a87b140471f544
pkgver=20251204
pkgrel=1
pkgdesc="Find locations of k-mers in a genome for k<32"
arch=('x86_64')
url="https://github.com/lh3/kmer-map"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('a4d98cb7fefd7600540789da17e7a6b3fa05b651c4ea56391d1c1941029ab769')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 kmer-map "$pkgdir/usr/bin/kmer-map"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
