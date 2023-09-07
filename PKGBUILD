# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=secret-diary-bin
_pkgname=Secret-Diary
pkgver=1.2.16
pkgrel=3
pkgdesc="Desktop diary tool. crypt with AES 256. 安全日记本，一个加密信息管理软件，加密强度非常强，只能暴力破解数据，只要密码足够复杂，数据就足够安全。"
arch=("x86_64")
url="http://rocket049.cn/"
_githuburl="https://github.com/rocket049/secret-diary"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'qt5-base' 'gcc-libs')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu2204_amd64.deb")
sha256sums=('a0d688214e98d391d61b44440bbe9249245041e97e1578e57868bcdcae6ac05b')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin}|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/Sd.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/Sd.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}