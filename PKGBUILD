# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=p3x-onenote-bin
_appname=P3X-OneNote
pkgver=2023.10.235
pkgrel=3
pkgdesc="Linux Electron Onenote - A Linux compatible version of OneNote"
arch=("aarch64" "armv7h" "x86_64")
url="https://www.corifeus.com/onenote/"
_githuburl="https://github.com/patrikx3/onenote"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'bash' 'electron24')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/patrikx3/onenote/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('43d62115105a7a3121ef478f774734805527088af89cb03dc82b3ef20b574666'
            '151cda88ecde1aed08744ebc5a68f70c3b7ff9357d55b259adb89d2ad1d2401a')
sha256sums_aarch64=('f413653c9de47df50d647019a1697eb7d785c5c24927ef451bda23e051099bfc')
sha256sums_armv7h=('0c74f66acb909ea1a24069ec1ea127e155efb49f166093238f922c8eef0bc31a')
sha256sums_x86_64=('79dd41dbc8f76ccd45cd7ddb6a5cda6b7fd8607dd2a2b076898ac9a35d0c2c6a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}