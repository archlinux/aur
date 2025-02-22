# Maintainer: Samet Güzeldemirci <samet@guzeldemirci.com>

pkgname=windsurf-ai-bin
_pkgname=Windsurf-AI
pkgver=1.3.4
pkgrel=1
pkgdesc="Codeium Windsurf AI Editor: A standalone VS Code derivative with AI-powered coding assistance (binary package)"
arch=('x86_64')
url="https://codeium.com/"
license=('MIT')
depends=('libxkbfile' 'gtk3' 'libsecret' 'nss' 'gcc-libs' 'libnotify' 'libxss' 'glibc' 'xdg-utils' 'alsa-lib')
optdepends=('glib2: Needed for move to trash functionality'
            'libdbusmenu-glib: Needed for KDE global menu')
provides=('windsurf-ai')
conflicts=('windsurf-ai')
source=("windsurf-ai.desktop::https://raw.githubusercontent.com/samex/windsurf-ai-arch-linux/main/windsurf-ai.desktop"
        "windsurf-ai.png::https://raw.githubusercontent.com/samex/windsurf-ai-arch-linux/main/windsurf-ai.png"
        "windsurf-ai-url-handler.desktop::https://raw.githubusercontent.com/samex/windsurf-ai-arch-linux/main/windsurf-ai-url-handler.desktop"
        "windsurf-ai-bin.sh::https://raw.githubusercontent.com/samex/windsurf-ai-arch-linux/main/windsurf-ai-bin.sh"
        "Windsurf-linux-x64-${pkgver}.tar.gz::https://github.com/samex/windsurf-ai-arch-linux/releases/download/${pkgver}/Windsurf-linux-x64-${pkgver}.tar.gz")
sha256sums=('9c40c193e020ce8041ef2ef9756fcbd431e376bb6fc6300a96bed703b1496ca2'
            '5c54ecf084dbaee5d85036205c2bb2df0d9b2bf77a503d722ee9833e4a236d7a'
            '043f74feb5946ca5b98dbc1bf8af0d5377a3e1308b77c426de8ad5645331915e'
            '041458f6ef3ccdc8b653cf93eb06d1b7930b5a37b27de3c57bf60ae44af81b0f'
            '6dcf686038c6587410b25dd041a748a59593164b6c3ffb31935abef1325bfa8c')

prepare() {
    mkdir -p "${srcdir}/windsurf-latest"
    tar -xzf "Windsurf-linux-x64-${pkgver}.tar.gz" -C "${srcdir}/windsurf-latest"
}

options=('!strip')

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    cp -r "${srcdir}/windsurf-latest/"* "${pkgdir}/opt/${_pkgname}"

    install -d "${pkgdir}/usr/bin"
    install -m755 "${srcdir}/windsurf-ai-bin.sh" "${pkgdir}/usr/bin/windsurf-ai"

    install -d "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/windsurf-ai.desktop" "${pkgdir}/usr/share/applications/windsurf-ai.desktop"
    install -m644 "${srcdir}/windsurf-ai-url-handler.desktop" "${pkgdir}/usr/share/applications/windsurf-ai-url-handler.desktop"

    install -d "${pkgdir}/usr/share/icons/hicolor/128x128/apps" 
    install -m644 "${srcdir}/windsurf-ai.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/windsurf-ai.png"
}