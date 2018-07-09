# Maintainer: 4leks4ndr <orthodox dot tk at gmail dot com>

pkgname=texlive-irmologion
pkgver=1.0
pkgrel=5
pkgdesc="TeX Live - Additional fonts from the site irmologion.ru to typeset Church Slavonic text"
arch=('any')
url="http://irmologion.ru"
license=('unknown')
makedepends=("unrar")
_font1=slavucs8_t1
_font2=psalucs8_t1
_font3=zlatucs8_t1
source=("${url}/fonts/${_font1}.rar"
        "${url}/fonts/${_font2}.rar"
        "${url}/fonts/${_font3}.rar")
noextract=("${_font1}.rar"
           "${_font2}.rar"
           "${_font3}.rar")

build() {
    cd "$srcdir"
    for i in *.rar; do
        unrar x $i
    done
}

package() {
    cd "$srcdir"
    install -dm755 "$pkgdir/var/lib/texmf/arch/installedpkgs"
    touch "$pkgdir/var/lib/texmf/arch/installedpkgs/${pkgname}_${pkgver}-$pkgrel.pkgs"
    install -dm755 "$pkgdir/usr/share/texmf/fonts/type1/csltex"
    install -Dm644 *.pfb "$pkgdir/usr/share/texmf/fonts/type1/csltex/"
}

md5sums=('b0139708a9bdf6fe31d591e4079d91e2'
         '24d0df891b96592f45278cfc7a320fe6'
         '2e1b85eb791fd986c99e556890c3caae')
