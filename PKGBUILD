# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream publishes no tags and no releases and has not changed since 2011
# (wgsim.c still reports 0.3.1-r13), so pkgver is the pinned commit's date and
# _tag carries the commit itself.

pkgname=wgsim
_tag=a12da3375ff3b51a5594d4b6fa35591173ecc229
pkgver=20111017
pkgrel=1
pkgdesc="Small tool for simulating sequence reads from a reference genome"
arch=('x86_64')
url="https://github.com/lh3/wgsim"
license=('MIT')
depends=('glibc' 'perl' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('e1e6bff5c084e4494023505206ae3e0b0f5a315c9f7390b2f347c370c7f36533')

build() {
    cd "$srcdir/$pkgname-$_tag"
    cc $CPPFLAGS $CFLAGS -Wall -o wgsim wgsim.c -lz -lm $LDFLAGS
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 wgsim "$pkgdir/usr/bin/wgsim"
    install -Dm755 wgsim_eval.pl "$pkgdir/usr/bin/wgsim_eval.pl"
    # upstream ships no LICENSE file: the MIT grant is the header of wgsim.c
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    awk 'NR==1,/^\*\//' wgsim.c > "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
