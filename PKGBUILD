# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="copybook-bin"
_appname="copy_book"
pkgver=0.2.10
pkgrel=1
pkgdesc='生成拼音、汉字、汉字字帖'
arch=(x86_64)
url="https://github.com/xxNull-lsk/Copybook"
license=('BSD')
depends=('zlib' 'glibc')
optdepends=()
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_appname}_linux_x64_${pkgver}.deb")
sha256sums=('9d3c2d0716e01de972640a9c42079165c552053768f9fc4dfe7a77e4762b64bf')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/opt/${_appname}/app.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}