# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>

pkgname=ttf-brill
pkgdesc='Brill Typeface by John Hudson for Brill Publishing House'
pkgver=2.06
pkgrel=2
url="https://brill.com/page/BrillFont/brill-typeface"
license=('custom')
arch=('any')
source=("https://brill.com/fileasset/downloads_static/static_typefacedownload_typefacepackage.zip")
sha256sums=('b58eeb26ea43d9a020ac9891a395ff7364bac7215d0714910561b675e4947166')

prepare () {
    local _completeversion="$pkgver 051"
    cd "Brill_Typeface_$pkgver"
    for f in  *"$_completeversion"*; do
        mv "$f" "${f// $_completeversion/}"
    done
    for f in  *_$pkgver*; do
        mv "$f" "${f//_$pkgver/}"
    done
}

package() {
    cd "Brill_Typeface_$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/fonts/TTF/" *.ttf
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" 00_Brill_Fonts_Read_Me_First.txt Brill_Fonts_End_User_License_Agreement.pdf
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" Brill_Typeface_User_Guide.pdf
}
