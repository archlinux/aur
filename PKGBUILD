# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>
# Upstream tags nothing, so pkgver is the pinned commit's date and _tag carries
# the commit itself.

pkgname=rmaxcut
_tag=02e9a9b655033bc745db674fd3651dd497986d74
pkgver=20210428
pkgrel=1
pkgdesc="Find approximate max-cuts in a large graph"
arch=('x86_64')
url="https://github.com/lh3/rmaxcut"
license=('MIT')
depends=('glibc' 'zlib')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('9521b7a01480851a4986a12a2e89567b270beabed31de30c66c157c69a075f0d')

build() {
    cd "$srcdir/$pkgname-$_tag"
    make
}

package() {
    cd "$srcdir/$pkgname-$_tag"
    install -Dm755 rmaxcut "$pkgdir/usr/bin/rmaxcut"
    # upstream ships no LICENSE file; the grant is the MIT block in kseq.h
    awk 'NR==1,/^\*\//' kseq.h > LICENSE
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
