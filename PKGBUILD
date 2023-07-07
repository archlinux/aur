# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="apk-installer"
pkgver=1.6.0
pkgrel=1
pkgdesc="一款可运行于windows、macos的Apk安装器软件，快速安装Apk至手机。"
arch=('any')
url="https://github.com/zhujiaming/apk-installer"
license=('ISC')
depends=('electron' 'java-runtime')
mkdenpends=('npm' 'gendesk' 'electron-builder')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('f58d1e672a98961307577251a5952521f723607d4920138e1d325bf14297c52c'
            '6d01ede600bb1fa0e725c92609dfd3f6ff8edb0440863e6a9b40c6075cfd8444')
#build() {
#    cd "${srcdir}/${pkgname%-bin}-${pkgver}"
#    npm install
#    sed 's|"author": "ah_zjm@163.com"|"author": "zhujiaming <ah_zjm@163.com>"|g' -i "${srcdir}/${pkgname%-bin}-${pkgver}/package.json"
#    sed '13i\  "homepage": "https://github.com/zhujiaming/apk-installer",' -i "${srcdir}/${pkgname%-bin}-${pkgver}/package.json"
#    sed 's|"deb", "rpm", "AppImage"|"AppImage"|g' -i "${srcdir}/${pkgname%-bin}-${pkgver}/build.config.js"
#    electron-builder --config build.config.js --linux
#}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/packages/linux-unpacked/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/resource/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility" --name "${pkgname%-bin}" --exec "/opt/${pkgname%-bin}/${pkgname%-bin} %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}