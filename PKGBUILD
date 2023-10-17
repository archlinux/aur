# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mark-flowy-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="Modern markdown editor application, Build fast and efficient workflows."
arch=("x86_64")
url="https://markflowy.vercel.app/"
_githuburl="https://github.com/drl990114/MarkFlowy"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('cairo' 'gtk3' 'webkit2gtk-4.1' 'gcc-libs' 'hicolor-icon-theme' 'gdk-pixbuf2' 'libsoup3' 'pango' 'glibc' 'glib2' 'libxcb')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('ccde2ae6d6f10b835964fe92dac7e8603ac8cf435fe54b8ccf557cba21ee54d2')
prepare() {
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