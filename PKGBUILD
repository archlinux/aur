# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf-latest
_pkgname=qgraf
pkgver=4.0.3
pkgrel=1
pkgdesc="Feynman diagram generator for various types of QFT models"
arch=('x86_64')
url="http://cefema-gt.tecnico.ulisboa.pt/~paulo/qgraf.html"
license=('LicenseRef-qgraf-license')
depends=('glibc' 'gcc-libs')
makedepends=('gcc-fortran')
provides=('qgraf')
conflicts=('qgraf')
source=("http://anonymous:aur@qgraf.tecnico.ulisboa.pt/links/$_pkgname-$pkgver.tgz")
sha256sums=('76abab0a773e6eac8a39b3c70b3c506cac347f565bba891b5ebc06be48273fc1')

build() {
    sed -n 's/^!//p' "$_pkgname-$pkgver.f08" > LICENSE
    mkdir -p fmodules
    gfortran -o "$_pkgname" -O2 -J fmodules "$_pkgname-$pkgver.f08"
}

package() {
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # documentation
    install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/" *.pdf
    # data
    install -m644 -Dt "$pkgdir/usr/share/$pkgname/" *.dat *.sty phi3 qcd qed qedx
    # binary
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
