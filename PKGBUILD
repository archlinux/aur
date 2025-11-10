# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron38-castlab-bin
pkgver='38.5.0+wvcus'
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
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/electron-v${pkgver}-linux-x64.zip")
sha256sums=('6f2e43d77341c437801bf6f0c5ee5bd3ec83a53c32b06945c37100ba04d83491')
prepare() {
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${pkgname%-bin}/electron" "${pkgdir}/usr/bin/electron36-castlab"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
