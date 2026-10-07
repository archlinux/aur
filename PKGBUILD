# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electron43-castlab-bin
pkgver='43.7.7+wvcus'
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
sha256sums=('52dda22afbbf942af90922882220bc428e54d6ad540d5fc0a999c2cdda74df46'
            'cea9f99f6d0a9a8bab239ffd2192dca3adf4f769b3123a2f366983c82d572ac9')
prepare() {
    sed -i "s/@ELECTRON@/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}.sh"
    install -Dm755 -d "${srcdir}/${pkgname%-bin}"
    bsdtar -xf "${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/${pkgname%-bin}"
    chmod u+s "${srcdir}/${pkgname%-bin}/chrome-sandbox"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
