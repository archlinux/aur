# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="translationcore-bin"
pkgver=3.4.0lite
_pkgver=3.4.0-LITE
pkgrel=1
pkgdesc="An open source platform for checking and managing Bible translation projects"
arch=('x86_64')
url="https://www.translationcore.com/"
_githuburl="https://github.com/unfoldingWord/translationCore"
license=('ISC')
conflicts=("${pkgname%-bin}")
depends=('nss' 'pango' 'gdk-pixbuf2' 'alsa-lib' 'libxcb' 'libxdamage' 'glibc' 'cairo' 'nspr' 'libcups' 'libxfixes' 'libxkbcommon' 'at-spi2-core' \
    'libxrandr' 'expat' 'hicolor-icon-theme' 'gtk3' 'glib2' 'libdrm' 'libxext' 'dbus' 'mesa' 'gcc-libs' 'libxcomposite' 'libx11')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${_pkgver}/tC-linux-x64-${_pkgver}-5b601bd.deb"
        "LICENSE::https://raw.githubusercontent.com/unfoldingWord/translationCore/develop/LICENSE")
sha256sums=('171ce1a32db7b30464a3d4b9296a4cefa6f789f8c6873b7964f9058da1231434'
            'a756bd73c46e3e9b85ff0222658f4c63851ebc5af63811adc4333ff618688417')
  
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    sed "s|unfoldingword-${pkgname%-bin}|${pkgname%-bin}|g" -i "${pkgdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/unfoldingword-${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16 22 32 48 64 128;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}-${_icons}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}