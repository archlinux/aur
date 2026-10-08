# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself. The repository is archived for historical record but the
# tool still builds and runs.

pkgname=mdust
_tag=3e3fed8da3965ddfc7b440a9ec371af14d4f5dc4
pkgver=20150102
pkgrel=1
pkgdesc="Masks low-complexity regions and finds duplicated segments in FASTA sequences"
arch=('x86_64')
url="https://github.com/lh3/mdust"
license=('Artistic-1.0')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('3199638f424d415f28b6f46a69d1cac1f9de605625c3edb958e78a3ee10eab14')

build() {
    cd "$srcdir/$pkgname-$_tag"
    # the 2006 sources call strlen()/exit() without including the headers
    make CFLAGS="$CFLAGS -include string.h -include stdlib.h"
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 mdust "$pkgdir/usr/bin/mdust"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
