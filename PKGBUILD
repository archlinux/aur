# Maintainer: Carlo Teubner <carlo@cteubner.net>
pkgname=rnv
pkgver=1.7.11.r71.g1cc3dd4
_commit=1cc3dd4619e5fa33fa8107abb6a79885e4545e8a
pkgrel=1
pkgdesc="Relax NG Compact Syntax validator"
arch=('x86_64')
url="https://github.com/hartwork/rnv"
license=('BSD-3-Clause')
depends=('expat')
makedepends=('asciidoc' 'git')
source=("git+${url}#commit=${_commit}")
b2sums=('483c3e35d2092e51d96352a36b64d83aaa05446b51738ac02d26afc64f4936938d255e83d34d8fbcf89295d5e9b921e22180fb8c6af11bf5448c3d7b8713bdc3')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "%s" "$(git describe --long --tags | sed 's/-/.r/;s/-/./')"
}

build() {
    cd "$srcdir/$pkgname"
    ./bootstrap
    ./configure --prefix=/usr
    make
}

check() {
    cd "$srcdir/$pkgname"
    make -k check
}

package() {
    cd "$srcdir/$pkgname"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
