# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=gpt-anywhere-bin
pkgver=0.0.1
pkgrel=5
pkgdesc="Use GPT anywhere with just one shortcut."
arch=('x86_64')
url="http://jinay.dev/gpt-anywhere/"
_ghurl="https://github.com/JinayJain/gpt-anywhere"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'webkit2gtk'
    'cairo'
    'gdk-pixbuf2'
    'pango'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('a589d4714b03d41b34ce8163ad7472b423b07ecb193c00187753adb125950cef')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|Categories=|Categories=Utility;|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}