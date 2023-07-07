# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="bbg-bin"
pkgver=20230706
pkgrel=1
pkgdesc="A static blog generator based on Electron Technology"
arch=('aarch64' 'x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('electron')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('953e8f37de2337fc082e59818f3a3b8f5574d3ce8b9890ae583fd9c9b9c39541')
sha256sums_aarch64=('20938ab1f6314c04a04dcf4c2606cd9b781dcf76ce6d127fbf738c721af69a4a')
sha256sums_x86_64=('77d60dd5c95d8755b1438f77b152c00903e00ac5ef2b05cdbb09b1f7e1ab6f39')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Baiyuanneko's Blog Generator/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/Baiyuanneko's Blog Generator/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/Baiyuanneko's Blog Generator/bbg\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}