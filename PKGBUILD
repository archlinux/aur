# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aviutl-package-manager-bin
pkgver=3.6.3
pkgrel=1
pkgdesc="AviUtl Package Manager - AviUtlやプラグイン・スクリプトを一括管理"
arch=('x86_64')
url="https://team-apm.github.io/apm/"
_githuburl="https://github.com/team-apm/apm"
license=('MIT')
options=(!strip)
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('glib2' 'alsa-lib' 'libdrm' 'libxcb' 'libxcomposite' 'libx11' 'libxkbcommon' 'libxext' 'gcc-libs' 'glibc' 'sh' 'cairo' 'gtk3' \
    'libxrandr' 'libxfixes' 'nss' 'pango' 'at-spi2-core' 'expat' 'dbus' 'nspr' 'libxdamage' 'mesa' 'libcups' 'lib32-gcc-libs' 'lib32-glibc')
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver}/AviUtl.Package.Manager-linux-x64-${pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/team-apm/apm/main/icon/apm256.png")
sha256sums=('6436430f394ec6a326fb1328c4856dbfc05c5031dd0b2dacbd566d4c93838ff8'
            '7b59d53b7a0d52c6885f52fe28fba7a3353ca8362f82ec0084f9652dff2d9b5e')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/AviUtl Package Manager-linux-x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f --icon "${pkgname%-bin}" --categories "Utility" --name "AviUtl Package Manager" --exec "/opt/${pkgname%-bin}/apm %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}