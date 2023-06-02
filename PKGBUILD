# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=maa-x-bin
pkgver=2.0.0beta.11
_pkgver=beta.11
pkgrel=1
pkgdesc="MAA GUI with Electron & Vue3"
arch=('x86_64')
url="https://www.maa.plus/"
_githuburl="https://github.com/MaaAssistantArknights/MaaX"
license=("AGPL3")
depends=('at-spi2-core' 'libdrm' 'perl' 'glibc' 'libxrandr' 'libcups' 'gcc-libs' 'nss' 'python' 'bash' 'libxkbcommon' 'pango' 'libxcb' 'mesa' 'glib2' \
    'gtk3' 'nspr' 'expat' 'libxcomposite' 'nodejs' 'libxdamage' 'libxext' 'alsa-lib' 'dbus' 'libx11' 'cairo' 'libxfixes')
makedepends=('gendesk')
conflicts=("${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.zip")
options=("!strip")
source=("${pkgname%-bin}-${pkgver}.zip::${_githuburl}/releases/download/v${pkgver%${_pkgver}}-${_pkgver}/${pkgname%-bin}-linux-x64-${pkgver%${_pkgver}}-${_pkgver}.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/MaaAssistantArknights/MaaX/dev/packages/common/resources/icon.png")
sha256sums=('569c8540be56e38b92ac9b8a76ffaf8dba133ca3d2c7459f31d7d95ef6fb905c'
            '2920264f809b69ccb61be013538c2162154e6ee7fa3d27e748eec89b51315b5b')
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${pkgname%-bin}-linux-x64" "${pkgdir}/opt/${pkgname%-bin}"
    chmod 755 "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "Maa-X" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}