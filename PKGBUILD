# Maintainer: m4rsquake <m4rsquake@outlook.com>

pkgname='gui-for-singbox-bin'
_pkgname='GUI.for.SingBox'
_installdir='gui-for-singbox'
pkgver='1.25.4'
pkgrel='10'
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
    "${pkgname%-bin}.rules"
)
sha256sums=('cf2367cb5203c583b4683187cde597e5bd7f9f2e55b08f9f2ba98c422c5bb793'
            '08257d0d21c76a56e48e38105460927293a452ddc6b0b62db401bf5b5b9b7adf'
            '576a9561c73fdc39f31670ac5cb6fefc61822a348f116f0d64f9e2e402882729'
            '617f6fbb2ee4b64f52f74ae03fbae549d2a9df52ef12218093631007618da5c1'
            'a3ab0b89a30d8e141a429b003eeb120ac6792542aff14b19a99940b442465f5f')

package() {
    # Binary
    install -Dm755 "${_pkgname}" "${pkgdir}/opt/${_installdir}/${_pkgname}"

    # Icon
    install -Dm644 "appicon.png" "${pkgdir}/opt/${_installdir}/icon/${pkgname%-bin}.png"

    # Desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"

    # Polkit rules
    install -Dm644 "${pkgname%-bin}.rules" "${pkgdir}/usr/share/polkit-1/rules.d/50-${_installdir}.rules"

    # NOTE: runtime data directories are created in .install, not tracked by pacman.
}
