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
pkgver=2.7.3b
pkgrel=2

source=("local://Crocotile3D_v${pkgver}_linux64.tar.gz"
    "${pkgname}.desktop"
    "${pkgname}.png"
    "${pkgname}.xml"
)

b2sums=(
    'c53dbee3af13d31024b0ac83207e5ff568fe04443c680656c94c7fa640206bc708c933c58c2f0c9d3ad1028b92db153170d2220f90a17ee7817934fc6bd472fa'
    '129cabb9c2a1c7f0b034bea4aaad1a4d4b2af00d4e7573369c6ee432bd460d9a2c1ff8388095aae8027901544e8ce93420cc6e445de662482bca774fa12e6b10'
    '639e3353647a10c0a1595cff37f00d12d55b353cfb1fcc5f2e09508b235d4819cb451bb704b3712bb523cde67543c26d2febea1831d6938f4e78222511f7a7ff'
    '124e5e8ab05d90d77b7c0347378a5f701c168e352dc7bf4f29a93446fe99af69a723166028a8e9d9c0c82d37a555d427e823095f5a3ef12e1d047d2835566f86'
)

pkgdesc='Tile-based 3D modeling application'
arch=('x86_64')
url="https://www.crocotile3d.com/"
license=('Unknown')
options=(!strip)

package() {
    # Install program
    install -d "${pkgdir}/usr/share/${pkgname}"
    cp -ar Crocotile3D_v${pkgver}_linux64/* "${pkgdir}/usr/share/${pkgname}/"
    chmod -R 755 "${pkgdir}/usr/share/${pkgname}"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install desktop entry
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Install MIME type; triggers the update-mime-database hook post install
    install -Dm644 "${srcdir}/${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"

    # Install MIME Type Icon plus symlink for GNOME.
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes/application-x-crocotile3d.png"
    ln -s "/usr/share/icons/hicolor/512x512/mimetypes/application-x-crocotile3d.png" "${pkgdir}/usr/share/icons/hicolor/512x512/mimetypes/gnome-mime-application-x-crocotile3d.png"
}
