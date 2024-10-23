# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf
pkgver=3.6.10
pkgrel=1
pkgdesc="Feynman diagram generator for various types of QFT models"
arch=('x86_64')
url="http://cefema-gt.tecnico.ulisboa.pt/~paulo/qgraf.html"
license=('LicenseRef-qgraf-license')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran')
source=("http://anonymous:aur@qgraf.tecnico.ulisboa.pt/links/$pkgname-$pkgver.tgz")
sha256sums=('6d4b5c6eb97de1942b824d80b8cb454dd77667492d0001e3bf21e761c5702194')

build() {
    sed -n 's/^!//p' "$pkgname-$pkgver.f08" > LICENSE
    mkdir -p fmodules
    gfortran -o "$pkgname" -O2 -J fmodules "$pkgname-$pkgver.f08"
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
