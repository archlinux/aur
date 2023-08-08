# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tts-vue
pkgver=1.9.15
pkgrel=1
pkgdesc="Microsoft speech synthesis tool, built using Electron+Vue+ElementPlus+Vite.微软语音合成工具,使用Electron+Vue+ElementPlus+Vite构建。"
arch=('x86_64')
url="https://tts-doc.loker.vip/home.html"
_githuburl="https://github.com/LokerL/tts-vue"
license=('MIT')
conflicts=("${pkgname}")
depends=('glibc' 'libdrm' 'mesa' 'expat' 'nss' 'cairo' 'gtk3' 'dbus' 'libxcb' 'nspr' 'pango' 'libxkbcommon' 'glib2' 'at-spi2-core' \
    'libxcomposite' 'libxdamage' 'libx11' 'gcc-libs' 'libxrandr' 'alsa-lib' 'libcups' 'libxext' 'libxfixes')
makedepends=('yarn' 'gendesk')
_install_path="/opt/appimages"
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('24b790413084a232302bcb0c37edf5216b47d56851b80efbfa9ce3d7c54ebd23')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    yarn install
    yarn build
}
package() {
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/${pkgver}/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/node.png" -t "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    gendesk -f -n --icon "${pkgname}" --categories "Utility" --name "${pkgname}" --exec "/opt/${pkgname}/${pkgname} --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}