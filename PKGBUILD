# Maintainer: Fred Junior <https://github.com/fredjunior54>
# Original packaging: Alessandro Lattao
pkgname=localbell-bin
pkgver=1.4.27
pkgrel=1
pkgdesc="Forward Android push notifications to your Linux desktop via D-Bus"
arch=('x86_64')
url="https://github.com/fredjunior54/localbell"
license=('AGPL-3.0-only')
depends=('glibc' 'gcc-libs' 'dbus' 'libxkbcommon' 'libglvnd')
optdepends=('xdg-utils: open the project page in the default browser')
options=('!strip')
provides=("localbell=$pkgver")
conflicts=('localbell')
_raw="https://raw.githubusercontent.com/fredjunior54/localbell/v${pkgver}"
source=("${url}/releases/download/v${pkgver}/localbell-${pkgver}-linux-amd64.tar.gz"
        "${_raw}/packaging/localbell.desktop"
        "${_raw}/server/assets/localbell-icon.png"
        "${_raw}/LICENSE"
        "${_raw}/server/assets/NERD-FONTS.txt"
        "${_raw}/server/assets/CaskaydiaCove-LICENSE.txt"
        "${_raw}/server/assets/Symbols-Nerd-LICENSE.txt"
)
sha256sums=(
    'e2c8d6ef5ff4df040201424d214bedeb0f7fe927d0bfce8e6e4854adfa872c09'
    'e16eeaeda23945b13fe1519e32aac5ee193c1661762a8a419339dd9a34db731c'
    'bd3ab4d40c5521c16649f6b2613c7197095455d21eb982af5555e6c71be4e230'
    'a9d185a0f74c027a02e64737085182dc514f759b2d9e86bb64e68478c94c0910'
    '08bde34f8617c4e48a8ded2b2ff910490d5ff14fb5c17c8fdda6dab58cacca45'
    'd66c377db5070ef1442d47519a558300e21791bebec2efa56efc6bfbf6e2c643'
    'bede0739eb2bf948765623a7a134360a6320240f4a9e29a5a68f31e191b0f8d0'
)

package() {
    install -Dm755 "${srcdir}/localbell" "${pkgdir}/usr/bin/localbell"
    install -Dm644 "${srcdir}/localbell-icon.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/localbell.png"
    install -d "${pkgdir}/usr/share/applications"
    sed 's|^Exec=.*|Exec=/usr/bin/localbell|' "${srcdir}/localbell.desktop" > "${pkgdir}/usr/share/applications/localbell.desktop"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}"/{CaskaydiaCove-LICENSE.txt,Symbols-Nerd-LICENSE.txt,NERD-FONTS.txt}
}
