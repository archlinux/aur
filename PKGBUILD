# Maintainer: alyssadaemon <alyssa at cute dot dev>
# Contributor: jdigi78 <jdigiovanni78 at gmail dot com>

#
# !! IMPORTANT NOTE !!
#
# This package will NOT build straight out of the box.
# You need to go to the itch.io page (https://prominent.itch.io/crocotile3d) and download the _linux64.tar.gz file
#
# This follows the same approach as `aseprite-bin` which is also hosted on Itch.io
# It looks like Itch.io uses signed akamai URLs (that expire), so we cannot use those.
#
# Should someone find a way to get them from Itch or another (official) source, I will happily update this to use that

pkgname=crocotile3d
pkgver=2.6.8
pkgrel=1

source=("local://Crocotile3D_v${pkgver}_linux64.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}.png")

b2sums=(
    '4ae54b5fa03dab2639a124218f8bf06a2738d4e0a955b539bbc1f8c2986f262ff4def538ac789f833a8d79c210be8f59913e01ff5c9ee7aeafced08de5f343f3'
    'e89839b218f91e41defe5259c2ccb326c184fc387e84cd73a6d65e951d454550bd5d57ec0b0dc2ed78d821012507dcd8a8e0c860ae61477351619d11a3441506'
    '639e3353647a10c0a1595cff37f00d12d55b353cfb1fcc5f2e09508b235d4819cb451bb704b3712bb523cde67543c26d2febea1831d6938f4e78222511f7a7ff'
)

pkgdesc='Tile-based 3D modeling application'
arch=('x86_64')
url="https://www.crocotile3d.com/"
license=('Unknown')
options=(!strip)

package() {
    # Install program
    install -d "${pkgdir}/usr/local/${pkgname}"
    cp -ar Crocotile3D_v${pkgver}_linux64/* "${pkgdir}/usr/local/${pkgname}/"
    chmod -R 755 "${pkgdir}/usr/local/${pkgname}"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
