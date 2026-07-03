# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron43-castlab-bin
pkgver='43.0.0+wvcus'
pkgrel=1
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
arch=('x86_64')
url="https://github.com/castlabs/electron-releases"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
optdepends=(
    'kde-cli-tools: file deletion support (kioclient5)'
    'pipewire: WebRTC desktop sharing under Wayland'
    'qt6-base: enable Qt6 with --enable-features=AllowQt'
    'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
    'trash-cli: file deletion support (trash-put)'
    "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('53782f44b8a88703ed54da1602c54c0af998ce076839f719efe1c850b05baccf'
            'ac1e26684ffbfc7ac0993c55b9299003f6b9efea25b755b1d260bea4db440157')
prepare() {
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
