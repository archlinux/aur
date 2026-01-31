# Maintainer: constitutional <constitutional@tuta.com>
pkgname=patreon-dl-gui-bin
_pkgname=patreon-dl-gui
pkgver=2.7.0
pkgrel=1
pkgdesc="GUI for patreon-dl - download media from Patreon"
arch=('x86_64')
url="https://github.com/patrickkfkan/patreon-dl-gui"
license=('MIT')
depends=(
    'gtk3'
    'nss'
    'alsa-lib'
    'libxss'
    'libnotify'
    'libappindicator-gtk3'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.deb::https://github.com/patrickkfkan/${_pkgname}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('833fd0f308038e98e1fbe7817fd678b6c38b7a5c8586e5b29c8b112282091fc6')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    # Fix chrome-sandbox permissions if present
    if [[ -f "${pkgdir}/opt/${_pkgname}/chrome-sandbox" ]]; then
        chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
    fi

    # Install license
    install -Dm644 "${pkgdir}/opt/${_pkgname}/LICENSE"* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
