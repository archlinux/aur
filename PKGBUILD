# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=no-fwl-bin
_appname=NoFWL
pkgver=0.1.0
pkgrel=3
pkgdesc="NoFWL Desktop Application"
arch=("x86_64")
url="https://nofwl.com/"
_githuburl="https://github.com/lencx/nofwl"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'hicolor-icon-theme' 'dbus' 'glib2' 'gcc-libs' 'gtk3' 'cairo' 'openssl' 'webkit2gtk' 'gdk-pixbuf2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}_${pkgver}_linux_${CARCH}.deb")
sha256sums=('01ec16f7997ceb8c9a017d3841cf63c3b29f59fb608523c3d54bd96ad72aa481')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.gz"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
}