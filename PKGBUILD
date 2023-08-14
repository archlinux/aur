# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=copybook-bin
_appname=copy_book
pkgver=1.0.1091
pkgrel=1
pkgdesc='生成拼音、汉字、汉字字帖'
arch=(x86_64)
url="https://github.com/xxNull-lsk/Copybook"
license=('BSD')
depends=('cairo' 'gcc-libs' 'glib2' 'pango' 'at-spi2-core' 'gtk3' 'libepoxy' 'gdk-pixbuf2' 'glibc')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x64.deb")
sha256sums=('12b3485b496ca938ac7a7a694b7b87a0011b25d2118ec26ed7a69d1b5c6cd00d')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}" --gname root --uname root
    sed "s|/opt/${pkgname%-bin}/data/flutter_assets/res/app.png|${pkgname%-bin}|g" -i "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/data/flutter_assets/res/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}