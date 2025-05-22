# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="electron36-castlab-bin"
pkgver='36.2.1+wvcus'
pkgrel=1
pkgdesc="Electron for Content Security (ECS) is a fork of Electron created by castLabs to facilitate the use of Google's Widevine Content Decryption Module (CDM) for DRM-enabled playback within Electron"
arch=('x86_64')
url="https://github.com/castlabs/electron-releases"
license=('MIT')
provides=("electron36=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    'electron36'
)
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
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_projectname}-v${pkgver}-linux-x64.zip")
sha256sums=('2417c5a8993c6d8434a6cd9eb063f7ec3c7bae82ce02fe09a0ef1d45a734fe64')
prepare() {
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib}
    cp -r --no-preserve=ownership --preserve=mode "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    ln -nfs "/usr/lib/${pkgname%-bin}/electron" "${pkgdir}/usr/bin/electron"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}