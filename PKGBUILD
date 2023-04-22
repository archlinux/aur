# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="stackzy-bin"
pkgver=1.2.5
pkgrel=3
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=(custom)
providers=()
confilts=("${pkgname%-bin}")
depends=(libxtst libglvnd fontconfig java-runtime libxrender alsa-lib hicolor-icon-theme glibc libxi libxext libx11 zlib)
options=(!strip)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${pkgname%-bin}_${pkgver}-1_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('26c3727c54db393ca6a6debe72e42551c26f4a850167549159824d9e74d5e59f'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's|Icon=/opt/stackzy/lib/Stackzy.png|Icon=stackzy|g;s|Unknown|Utility;Development;|g' -i "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Stackzy.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-Stackzy.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/Stackzy.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}