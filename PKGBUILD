# Maintainer: Ckat <ckat@teknik.io>
# Contributor: Ryan Farley <ryan.farley@gmx.com>

pkgname=dina-font-otb
pkgver=2.92
pkgrel=9
pkgdesc="A monospace bitmap font, primarily aimed at programmers (OTB Format)"
arch=('any')
url="https://www.dcmembers.com/jibsen/download/61/"
license=('custom')
depends=('fontconfig')
makedepends=('fonttosfnt')
conflicts=('dina-font' 'dina-powerline' 'dina-font-otb-alt')
source=("dina-$pkgver-new.zip::https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61")
md5sums=('028424baac750e9fd0f54df03202e5d0')

_ex_pt() {
    _pt=${1%.bdf}
    _pt=${_pt#*-}
    echo $_pt
}

build() {
    cd "$srcdir/BDF"
    for f in *.bdf; do
        fonttosfnt -o "${f/bdf/otb}" "$f"
    done
}

package() {
    cd "$srcdir/BDF"
    for i in *.otb; do
        install -Dm 644 $i "$pkgdir/usr/share/fonts/misc/$i"
    done
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
