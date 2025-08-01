# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gopeed-bin
_pkgname=Gopeed
pkgver=1.7.1
pkgrel=2
pkgdesc="High speed downloader that supports all platforms.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://gopeed.com/"
_ghurl="https://github.com/GopeedLab/gopeed"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}-${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'libdbusmenu-glib'
    'libayatana-appindicator'
    'libayatana-indicator'
    'ayatana-ido'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-amd64.deb")
sha256sums=('3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
sha256sums_aarch64=('c217b1be9efd369d57ea9b82df9226024694f2612029b6e06b9c6b869ca0fc4b')
sha256sums_x86_64=('4db53a5acc5b9809dfd28393ce4399a46eb17d73eb2d5e69fe224a123acaca7b')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/usr/lib"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
