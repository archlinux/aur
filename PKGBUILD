# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lettura-bin
_pkgname=lettura
pkgver=0.1.9_1
pkgrel=1
pkgdesc="Another free and open-source feed reader"
arch=('x86_64')
url="https://github.com/zhanglun/lettura"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'libsoup' 'webkit2gtk' 'hicolor-icon-theme' 'gcc-libs' 'glib2' 'gdk-pixbuf2' 'glibc' 'gtk3' 'pango' 'openssl-1.1')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb")
sha256sums=('daf3745db0f411e3300bfa20eeb11aa51bda5735c71ad697d80444a19c2d6e42')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2}/apps"
    done
}