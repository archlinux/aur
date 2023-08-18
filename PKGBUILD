# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bbg-bin
_appname="Baiyuanneko's Blog Generator"
pkgver=20230820
pkgrel=1
pkgdesc="A static blog generator based on Electron Technology"
arch=('aarch64' 'x86_64')
url="https://bbg.nekomoe.xyz/"
_githuburl="https://github.com/bbg-contributors/bbg"
license=('Unlicense')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/bbg-contributors/bbg/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('436a6d536138f203ac333858cff92a568be62797752b3adb94bcaa0f6ffe7ef6'
            '8ef485f39b0d853c86f68cb8c7fad8b4c8cbe5f16f59366de1c02f1ae9e37f3a')
sha256sums_aarch64=('f51af1e9f386097b40bd8f92f5c00784b8eac88cd3866101d014bad41c21ff0c')
sha256sums_x86_64=('c8b342c0c4e8d60230bfaea9b65a0ed757f32fc82c4ce18b1c1049fa96fff32a')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|\"/opt/${_appname}/${pkgname%-bin}\" %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}