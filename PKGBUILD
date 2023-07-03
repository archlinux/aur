# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="copybook-bin"
_appname="copy_book"
pkgver=0.2.9
pkgrel=1
pkgdesc='生成拼音、汉字、汉字字帖'
arch=(x86_64)
url="https://github.com/xxNull-lsk/Copybook"
license=('BSD3-Clause')
options=('!strip')
depends=('zlib' 'glibc')
optdepends=()
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_appname}_linux_x64_${pkgver}.deb")
sha256sums=('cb8b6b6cf0eddcbf74777ef3d9659408082595971a65ff19d8339154c76b6fa9')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    mv "${pkgdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|/opt/${_appname}/app.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${_appname}/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}