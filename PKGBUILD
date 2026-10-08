# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.
# Upstream ships no LICENSE file; the only licence text in the tree is the MIT
# grant heading the vendored klib headers, so that is what gets installed.

pkgname=etrf
_tag=fc059d519f8b899c682187d8c74543fed1ba0cf8
pkgver=20191022
pkgrel=1
pkgdesc="Exact tandem repeat finder"
arch=('x86_64')
url="https://github.com/lh3/etrf"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('9504489d0e18b9a352050d3936e4716b2cccce7af97515de35f3bf0d78c7f750')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 etrf "$pkgdir/usr/bin/etrf"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
