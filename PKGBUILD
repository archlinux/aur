# Maintainer: Massimo Branchini <max dot bra dot gtalk at gmail dot com>
# Contributor: John-Michael Mulesa <jmulesa at gmail dot com>

pkgname=booktab-wine
_pkgname=booktab
pkgver=4.24
pkgrel=1
pkgdesc="MyZanichelli - La piattaforma che ti permette di consultare tutti i tuoi libri scolastici in versione multimediale e interattiva (wine version)."
arch=('x86_64')
url="https://booktab.it/"
license=('custom')
conflicts=('booktab')
depends=('wine')
makedepends=('innoextract' 'icoutils')

_debname=BooktabSetup64.exe

source=("https://booktab.it/setup-z/$pkgver/BooktabSetup64.exe"
        "${_pkgname}.sh"
        "${_pkgname}.desktop")
sha256sums=('7136bdc1e4be0c2ae280bf0ec0739133a3914ff4ce3ba5092b4c1bf15fe58da8'
            'd86ebb94c4a838db1bc8fc39a64b4f9b1ff0dff32985af357bc68af0a11a06ef'
            'fd991fef15910b4beb0c25869f86178077b651213bc9e3378aa398a169982492')

prepare() {
    innoextract -s "BooktabSetup64.exe"
    icotool -x -o . app/BooktabZ.ico
}

package() {
    mkdir -p $pkgdir/opt/${_pkgname}
    cp -r $srcdir/app/* $pkgdir/opt/${_pkgname}/
    install -Dm644 "${srcdir}/BooktabZ_6_256x256x32.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"
    install -D -m 644 $srcdir/${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
    install -D -m 755 $srcdir/${_pkgname}.sh $pkgdir/usr/bin/${_pkgname}
}

