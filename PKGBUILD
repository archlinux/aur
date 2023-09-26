# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=one-gpt-bin
pkgver=0.9.2
pkgrel=4
pkgdesc="聚合ChatGPT官方版、ChatGPT免费版、文心一言、Poe、chatchat等多平台,支持自定义导入平台"
arch=('x86_64')
url="https://github.com/1595901624/gpt-aggregated-edition"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('hicolor-icon-theme' 'glibc' 'openssl-1.1' 'gdk-pixbuf2' 'webkit2gtk' 'cairo' 'gcc-libs' 'glib2' 'pango' 'gtk3' 'libsoup')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('3da0ae73b81ff8b57b049b883041125e6c756eb49cea227ebc5b53d24331ba25')
prepare() {
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