# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moneydance-bin
_appname=Moneydance
pkgver=2023.1.5006
pkgrel=3
pkgdesc="An easy to use and full-featured personal finance app that doesn't compromise your privacy. "
arch=('x86_64')
url="http://moneydance.com/"
license=('custom:commercial')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('freetype2' 'sh' 'zlib' 'libxtst' 'gdk-pixbuf2' 'libxrender' 'libglvnd' 'libxi' 'java-runtime' 'gtk2' \
    'hicolor-icon-theme' 'libxext' 'libx11' 'cairo' 'glibc' 'glib2' 'pango' 'gtk3' 'alsa-lib')
makedepends=('gendesk')
source=("${pkgname%-bin}-${pkgver}.deb::https://infinitekind.com/stabledl/current/${pkgname%-bin}_linux_amd64.deb")
sha256sums=('abe15c7a10576cfeca5283f5ba30a9164c70ad4653928912675a65cd0748d208')
package() {
    bsdtar -xf "${srcdir}/data.tar.bz2" -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${_appname}/resources/license.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 32x32 128x128 512x512;do
        install -Dm644 "${pkgdir}/opt/${_appname}/resources/${pkgname%-bin}_icon${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Finance;Utility" --name "${_appname}" --exec "/opt/${_appname}/${_appname}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}