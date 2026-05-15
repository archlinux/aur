# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=dwproton-launcher
pkgver=1.0
pkgrel=1
pkgdesc="Add a command line launcher and mimetype association for launching standalone games directly with dwproton"
arch=(any)
url="https://aur.archlinux.org/packages/dwproton-launcher"
license=('MIT')
depends=(dwproton
         hicolor-icon-theme
         bash)
source=("dwproton.sh"
        "dwproton.desktop"
        "dwproton.svg")
sha256sums=('8791252fa14bcc80b2902a44d064dc8afd0ba231728fa81bd59b62c8805f885f'
            'a49b2866ba5b3024d4fa424f4c20c05ddd391138d1afde02497ebe9409e88ae2'
            '91e994eaa1a81ca54ec85c2ed4b6c89509e04fe3b37371327f86952f60a8f6c3')
makedepends=('imagemagick')

prepare() {
    magick -background none -density 1000 \
      "${srcdir}/dwproton.svg" -resize 512x512! \
      "${srcdir}/dwproton.png"

    rm -f "${srcdir}/dwproton.svg"
}

package() {
    install -Dm644 "${srcdir}/dwproton.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/dwproton.png"
    install -Dm644 "${srcdir}/dwproton.desktop" "${pkgdir}/usr/share/applications/dwproton.desktop"
    install -Dm755 "${srcdir}/dwproton.sh" "${pkgdir}/usr/bin/dwproton"
}

