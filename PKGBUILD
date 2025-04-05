# Maintainer: nezu <nezu@nezu.cc>
# Contributor: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=itext-rups-bin
_pkgname=itext-rups
pkgver=25.03
pkgrel=1
pkgdesc='iText RUPS is a tool to view PDF structure in a Swing GUI.'
provides=("$_pkgname")
arch=('any')
url='https://github.com/itext/rups'
license=('AGPL3')
depends=(bash java-runtime hicolor-icon-theme)
makedepends=('imagemagick>=7')
sha256sums=('c9b4e4c2b77b89c1e01354d059ea6abf0ea34fff0b33ad50d349ad875cb93d6a'
            'c213befd1132bebcbc588a7ef52c0089682767618317bd09128668d3550218b3'
            '6c3da33137ec3a0e76df60c6c3fa7e0ea66218fa0c3c61a6d92b8d3c3f182840'
            '226be57182f49ed2667a606d04251b47d0427850f71dd469d92a864173d5745d')
source=(
    "itext-rups.sh"
    "itext-rups.desktop"
    "https://github.com/itext/rups/releases/download/${pkgver}/iText-RUPS-${pkgver}-only-jars.zip"
    "https://raw.githubusercontent.com/itext/rups/${pkgver}/src/main/resources/com/itextpdf/rups/logo.png"
)

build() {
    magick logo.png -resize 48x48 "itext-rups-48x48.png"
    magick logo.png -resize 64x64 "itext-rups-64x64.png"
    magick logo.png -resize 128x128 "itext-rups-128x128.png"
    magick logo.png -resize 256x256 "itext-rups-256x256.png"
    magick logo.png -resize 512x512 "itext-rups-512x512.png"
    # the logo.png is originally 1024x1024
}

package() {
    cd "$srcdir"

    install -Dm755 itext-rups.sh "${pkgdir}/usr/bin/$_pkgname"
    install -Dm644 "${_pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/$_pkgname/$_pkgname.jar"
    install -Dm644 "itext-rups.desktop" "${pkgdir}/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "itext-rups-48x48.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/$_pkgname.png"
    install -Dm644 "itext-rups-64x64.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/$_pkgname.png"
    install -Dm644 "itext-rups-128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$_pkgname.png"
    install -Dm644 "itext-rups-256x256.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/$_pkgname.png"
    install -Dm644 "itext-rups-512x512.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$_pkgname.png"
    install -Dm644 "logo.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/$_pkgname.png"
}
