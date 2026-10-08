# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. Upstream ships no LICENSE file; the licence text in the
# tree is the MIT grant heading the bundled klib headers, so that is installed.

pkgname=partig
_tag=dcd2f76be562415673ceb061d2f34f1c0b0285c0
pkgver=20210412
pkgrel=1
pkgdesc="Experimental tool to estimate the similarity between all pairs of contigs"
arch=('x86_64')
url="https://github.com/lh3/partig"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('2100bb93d30d7655d1597d635f122c56f65aa0eed9248f30c1f29ccedea868ed')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 partig "$pkgdir/usr/bin/partig"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
