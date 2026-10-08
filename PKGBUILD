# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. Upstream ships no LICENSE file; the licence text in the
# tree is the MIT grant heading the bundled klib headers, so that is installed.

pkgname=gffio
_tag=1f568f4b7728d10f45c0714a34cc6813dab5971b
pkgver=20221216
pkgrel=1
pkgdesc="GFF/GTF reader and writer"
arch=('x86_64')
url="https://github.com/lh3/gffio"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('c0509a6109315391f535422c63871a96ea651f575d8c2a5edc42c2b1526cb1c1')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 gffio "$pkgdir/usr/bin/gffio"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
