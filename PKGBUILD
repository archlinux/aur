# Maintainer: creations
# Forked from Vesktop
_pkgname=Equibop
pkgname=equibop-bin
_appname=equibop-desktop
pkgver=3.3.3
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
sha256sums_aarch64=('ffc7174efe609aa5d753582c1f6e9190fe4e692f574a002a144f3c190b94a3b4')
sha256sums_x86_64=('a74357f9078aa8fb60aca6404148e9a8f5cdf73114b8257f07959e469e66bd27')
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
