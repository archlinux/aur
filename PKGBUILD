# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf
pkgver=3.5.0
pkgrel=1
pkgdesc="Feynman diagram generator for various types of QFT models"
arch=('x86_64')
url="http://cfif.ist.utl.pt/~paulo/qgraf.html"
license=('custom')
depends=('gcc-libs')
makedepends=('gcc-fortran')
source=("http://anonymous:aur@qgraf.tecnico.ulisboa.pt/v${pkgver%.*}/$pkgname-$pkgver.tgz")
sha256sums=('09228905ffa8e6b7d07d1c17b6e20c91a16d3d66193de5271b868d759deb175a')

build() {
    sed -n 's/^!//p' qgraf-3.5.0.f08 > LICENSE
    mkdir -p fmodules
    gfortran -o "$pkgname" -O2 -Jfmodules "$LDFLAGS" qgraf-3.5.0.f08
}

package() {
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # documentation
    install -dm755 "$pkgdir/usr/share/doc/$pkgname/"
    install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgname/"
    # data
    install -dm755 "$pkgdir/usr/share/$pkgname/"
    install -m644 *.dat *.sty phi3 qcd qed "$pkgdir/usr/share/$pkgname/"
    # binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
