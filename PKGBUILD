# Maintainer: m4rsquake <m4rsquake@outlook.com>

pkgname='gui-for-singbox-bin'
_pkgname='GUI.for.SingBox'
pkgver='1.25.4'
pkgrel='5'
pkgdesc='GUI for SingBox (precompiled binary)'
arch=('x86_64')
license=('GPL3')
depends=(
    'glibc'
    'sing-box'
    'webkit2gtk-4.1'
)
makedepends=('unzip')
provides=("${pkgname%-bin}")
conflicts=(
    'gui-for-singbox'
    'gui.for.singbox'
)
url="https://github.com/GUI-for-Cores/${_pkgname}"
install="${pkgname%-bin}.install"

source=(
    "https://github.com/GUI-for-Cores/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.zip"
    "https://raw.githubusercontent.com/GUI-for-Cores/${_pkgname}/main/build/appicon.png"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.install"
)
sha256sums=('cf2367cb5203c583b4683187cde597e5bd7f9f2e55b08f9f2ba98c422c5bb793'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            'faf593c95517a35b7ddd930cdcb84a595c1ee0cd813cbc61b353af7720c08271'
            '0b89ed67853ad0c578904914cc96ee44bf4a973d7cad78d43a675bd6e616d634')

package() {
    # Binary — the only file under /opt that is package-managed
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${pkgname}/${_pkgname}"

    # Icon
    install -Dm644 "appicon.png" "${pkgdir}/opt/${pkgname}/icon/${pkgname%-bin}.png"

    # Desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # NOTE: runtime data directories (data/ and its subdirs) are NOT created here.
    # They are created in the .install script so pacman does NOT track them —
    # this way user plugins/configs survive package upgrades.
}
