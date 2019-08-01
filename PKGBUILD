# Maintainer: Ckat <ckat@teknik.io>

pkgname=dina-font-otb
pkgver=2.92
pkgrel=7
pkgdesc="A monospace bitmap font, primarily aimed at programmers(OTB)"
arch=('any')
url="https://www.dcmembers.com/jibsen/download/61/"
license=('custom')
depends=('xorg-font-utils' 'fontconfig')
makedepends=('fontforge')
conflicts=('dina-font' 'dina-powerline')
source=("dina-$pkgver-new.zip::https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61" "otbconvert.pe")
md5sums=('028424baac750e9fd0f54df03202e5d0'
         'ef3dae0059b22d7c232cbd04d9cffff8')

_ex_pt() {
    _pt=${1%.bdf}
    _pt=${_pt#*-}
    echo $_pt
}

build() {
    cd "$srcdir/BDF"
    sed -i 's/microsoft-cp1252/ISO8859-1/' *.bdf
    ../otbconvert.pe *.bdf
}

package() {
    cd "$srcdir/BDF"
    for i in *.otb; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
