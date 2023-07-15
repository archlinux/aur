# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=live-radio-app-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="An Electron application with React and TypeScript.Streaming norwegian live radio"
arch=('x86_64')
url="https://github.com/JesperBry/live-radio-app"
license=('custom')
conflits=("${pkgname%-bin}")
depends=('bash' 'electron23')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/radio-app_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('1454aaaa2bac0e6c8167bc570884165ae68602df10c2ba2b966ef0fc560307da'
            'b11c8ccf64df53eb19d5c0898d8421c5cecc284157625d21dbe2e4482ee41416')
      
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Live radio/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Live radio/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|\"/opt/Live radio/radio-app\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|radio-app|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/radio-app.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/radio-app.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/radio-app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png" 
}