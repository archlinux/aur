# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bbg-bin
_appname="Baiyuanneko's Blog Generator"
pkgver=20230706
pkgrel=2
pkgdesc="A static blog generator based on Electron Technology"
arch=('aarch64' 'x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/bbg-contributors/bbg/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6'
            '8ef485f39b0d853c86f68cb8c7fad8b4c8cbe5f16f59366de1c02f1ae9e37f3a')
sha256sums_aarch64=('20938ab1f6314c04a04dcf4c2606cd9b781dcf76ce6d127fbf738c721af69a4a')
sha256sums_x86_64=('77d60dd5c95d8755b1438f77b152c00903e00ac5ef2b05cdbb09b1f7e1ab6f39')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}