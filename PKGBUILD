# Maintainer: creations
# Forked from Vesktop
_pkgname=Equibop
pkgname=equibop-bin
_appname=equibop-desktop
pkgver=3.3.4
pkgrel=1
pkgdesc="A custom Discord desktop app with Equicord pre-installed (binary release)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Equicord/Equibop"
license=('GPL-3.0-only')
provides=(
    "${pkgname%-bin}=${pkgver}"
    "${_appname}=${pkgver}"
)
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
options=('!strip')
source=("${pkgname%-bin}.sh"
        "icon.png::https://raw.githubusercontent.com/Equicord/Equibop/v${pkgver}/static/icon.png")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.tar.gz")
sha256sums=('2b191fca6474ba8150c3f3627c83578129c6e5328effa8eb74d8f70f64f8f5ea'
            '280156676d268d80f65ea3e592bacdd0df5bd78e69872211c624fa07ea062cb8')
sha256sums_aarch64=('e2605eddbfec333948cde10757cc26ab10fd99e7d7930e59c27f2ab8d02867fc')
sha256sums_x86_64=('66ed6675185db9a7130eedf00b224e923f2dffd11eaa20708942c0b9e03ed9dd')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -R "${srcdir}/${pkgname%-bin}-${pkgver}/." "${pkgdir}/usr/lib/${pkgname%-bin}/"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" << END
[Desktop Entry]
Name=Equibop
GenericName=Internet Messenger
Type=Application
Categories=Network;InstantMessaging;Chat;
Keywords=discord;vencord;electron;chat;equibop
MimeType=x-scheme-handler/discord;
Exec=${pkgname%-bin} %U
Icon=${pkgname%-bin}
StartupWMClass=equibop
END
}
