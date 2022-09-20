# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf
pkgver=3.6.4
pkgrel=1
pkgdesc="Feynman diagram generator for various types of QFT models"
arch=('x86_64')
url="http://cfif.ist.utl.pt/~paulo/qgraf.html"
license=('custom')
depends=('gcc-libs')
makedepends=('gcc-fortran')
source=("http://anonymous:aur@qgraf.tecnico.ulisboa.pt/links/$pkgname-$pkgver.tgz")
sha256sums=('7997788082fc1a393a0db1c066567d55aea996e8350c2e7ff21945ddcb603e97')

build() {
    sed -n 's/^!//p' "$pkgname-$pkgver.f08" > LICENSE
    mkdir -p fmodules
    gfortran -o "$pkgname" -O2 -J fmodules "$LDFLAGS" "$pkgname-$pkgver.f08"
}

package() {
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
    install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgname/"
    # data
    install -dm755 "$pkgdir/usr/share/$pkgname/"
    install -m644 *.dat *.sty phi3 qcd qed qedx "$pkgdir/usr/share/$pkgname/"
    # binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
