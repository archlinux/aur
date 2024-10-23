# Maintainer: Magnus Schaaf <magnusschaaf plus arch at gmail dot com>
pkgname=qgraf-latest
_pkgname=qgraf
pkgver=4.0.5
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
sha256sums=('2dabf4305aa192ef78621763bb9e275fdcbd900d435f8dcb7d1aed916bab0a99')

build() {
    cd "$_pkgname-$pkgver.dir"
    sed -n 's/^!//p' "$_pkgname-$pkgver.f08" > LICENSE
    make "$_pkgname"
}

package() {
    cd "$_pkgname-$pkgver.dir"
    # license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # documentation
    install -m644 -Dt "$pkgdir/usr/share/doc/$pkgname/" *.pdf
    # data
    install -m644 -Dt "$pkgdir/usr/share/$pkgname/" *.dat
    install -m644 -Dt "$pkgdir/usr/share/$pkgname/styles/" styles/*
    install -m644 -Dt "$pkgdir/usr/share/$pkgname/models/" models/*
    # binary
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
