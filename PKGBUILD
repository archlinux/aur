# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. Upstream ships no LICENSE file; the licence text in the
# tree is the MIT grant heading the bundled klib headers, so that is installed.

pkgname=pre-pe
_tag=1c54605ff078e7ed11708a271827a14b0ce2b3ff
pkgver=20180628
pkgrel=1
pkgdesc="Preprocessing of paired-end reads from experiment-specific protocols"
arch=('x86_64')
url="https://github.com/lh3/pre-pe"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('8c5e10c061866a7109a407de28b968d18e6708e8d9033642599d4948fa03dacc')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 pre-adna "$pkgdir/usr/bin/pre-adna"
    install -Dm755 pre-lianti "$pkgdir/usr/bin/pre-lianti"
    install -Dm755 pre-dip-c "$pkgdir/usr/bin/pre-dip-c"
    install -Dm755 pre-meta "$pkgdir/usr/bin/pre-meta"
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' kseq.h > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
