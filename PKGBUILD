# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=duolingo-desktop-bin
_appname="dl-desktop"
pkgver=3.4.0
pkgrel=1
pkgdesc="Desktop client for the Duolingo language learning application"
arch=("x86_64")
url="https://github.com/hmlendea/dl-desktop"
license=('GPL3')
depends=('dbus' 'pango' 'libx11' 'libxcomposite' 'libcups' 'libxrandr' 'glib2' 'libxfixes' 'gtk3' 'gcc-libs' 'libxkbcommon' 'glibc' 'expat' \
    'libxdamage' 'cairo' 'at-spi2-core' 'libdrm' 'libxcb' 'mesa' 'libxext' 'nss' 'nspr' 'alsa-lib')
conflicts=("${pkgname%-bin}-appimage" "${_appname}" "${pkgname%-bin}")
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=("${pkgname%-bin}-${pkgver}.zip::${url}/releases/download/v${pkgver}/${_appname}_${pkgver}_linux.zip"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/hmlendea/dl-desktop/master/icon.png")
sha256sums=('a1e84de8f5aa15b6d4e31bead8fdb346ed068bca7efe0541da0f2bf1497aae1d'
            '67642cd03a241ff097a83800f39e442c533e8b7a92a9235c0375ef866a708f0e')
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    sed "s|Exec=/opt/${_appname}/${_appname}|Exec=/opt/${pkgname%-bin}/${_appname}|g;s|Icon=ro.go.hmlendea.DL-Desktop|Icon=${pkgname%-bin}|g" \
        -i "${pkgdir}/opt/${pkgname%-bin}/ro.go.hmlendea.DL-Desktop.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/ro.go.hmlendea.DL-Desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}