# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf
pkgver=3.6.7
pkgrel=1
pkgdesc="Feynman diagram generator for various types of QFT models"
arch=('x86_64')
url="http://cfif.ist.utl.pt/~paulo/qgraf.html"
license=('custom')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran')
source=("http://anonymous:aur@qgraf.tecnico.ulisboa.pt/links/$pkgname-$pkgver.tgz")
sha256sums=('567e57a9512230fd08b84a7393fc1308ae8970f0ed64a347da89aca42acd314c')

build() {
    sed -n 's/^!//p' "$pkgname-$pkgver.f08" > LICENSE
    mkdir -p fmodules
    gfortran -o "$pkgname" -O2 -J fmodules "$LDFLAGS" "$pkgname-$pkgver.f08"
}

package() {
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # documentation
    install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/" *.pdf
    # data
    install -m644 -Dt "$pkgdir/usr/share/$pkgname/" *.dat *.sty phi3 qcd qed qedx
    # binary
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
}
