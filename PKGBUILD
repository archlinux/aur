# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=appimagepool-bin
pkgver=5.1.0
pkgrel=4
pkgdesc="A simple, modern AppImageHub Client, powered by flutter."
arch=('x86_64')
url="https://www.pling.com/p/1547076/"
_ghurl="https://github.com/prateekmedia/appimagepool"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'gtk3'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz"
    "${pkgname%-bin}.sh"
)
sha256sums=('265d503d064f92334a5c7f4a90988931dee9451f4831c3751b49eeea7a016769'
            '87aad073913a72e5fa1c7f4e0f6f695dafc5ba8ea675a62be03c532c701c243a')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.svg" \
        -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
}