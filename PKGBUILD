# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Scoring a genome needs a pre-trained model, which upstream publishes on
# Zenodo (https://zenodo.org/records/15814006) rather than in the repo.
# Upstream ships no LICENSE file; the licence text in the tree is the MIT grant
# heading the bundled klib headers, so that is what gets installed.

pkgname=minisplice
pkgver=0.4
pkgrel=1
pkgdesc="Splice site scoring with a deep-learning model"
arch=('x86_64')
url="https://github.com/lh3/minisplice"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9eb6dd56f60cc3059da50ef5167dda938854bba7247301a3e08da12b00dc2319')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 minisplice "$pkgdir/usr/bin/minisplice"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
