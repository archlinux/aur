# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=whatsapp-for-linux-bin
_origname=com.github.eneshecan.WhatsAppForLinux
pkgver=1.6.4
pkgrel=4
pkgdesc="An unofficial WhatsApp desktop application for Linux."
arch=('x86_64')
url="https://github.com/eneshecan/whatsapp-for-linux"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libcanberra'
    'gtkmm3'
    'libayatana-appindicator'
    'atkmm'
    'glibmm'
    'libsigc++'
    'gtk3'
    'webkit2gtk'
    'hicolor-icon-theme'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('f8c0dc44cd2122962325211238489089c7024b6bc75391254701af6591295d89')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|${_origname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_origname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${_origname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_origname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/status/${_origname}-tray.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/status/${pkgname%-bin}-tray.png"
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/status/${_origname}-tray-attention.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-tray-attention.png"
    done
    install -Dm644 "${srcdir}/usr/share/metainfo/${_origname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    cp -r "${srcdir}/usr/share/locale" "${pkgdir}/usr/share"
}