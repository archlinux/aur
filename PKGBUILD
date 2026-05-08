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
pkgver=2.6.9
pkgrel=3

source=("local://Crocotile3D_v${pkgver}_linux64.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}.png")

b2sums=(
    '31883a70e872ad068785104ec31ac703e524794e0bd1dcd57d135acaf3b05a8ac0602652f975169fc1dc4b5e103ab9f2e661953dfbf79820bf6396fea8305595'
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
    ln -s "/usr/local/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
