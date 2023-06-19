# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="secret-diary-bin"
pkgver=1.2.16
pkgrel=2
pkgdesc="linux / windows desktop diary tool. crypt with AES 256. 安全日记本，一个加密信息管理软件，加密强度非常强，只能暴力破解数据，只要密码足够复杂，数据就足够安全。"
arch=("x86_64")
url="http://rocket049.cn/"
_githuburl="https://github.com/rocket049/secret-diary"
license=('Apache')
depends=('glibc' 'qt5-base' 'gcc-libs')
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-ubuntu2204_amd64.deb")
sha256sums=('a0d688214e98d391d61b44440bbe9249245041e97e1578e57868bcdcae6ac05b')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}"
    mv "${pkgdir}/usr/share/applications/Secret-Diary.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/opt/${pkgname%-bin}/Sd.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/Sd.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}