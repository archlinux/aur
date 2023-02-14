# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=13.2.1026.36
pkgrel=1
epoch=
pkgdesc="360 Browser stable version"
arch=("x86_64")
url="https://browser.360.cn"
license=('custom')
depends=(alsa-lib at-spi2-core nss gtk3 gtk2)
optdepends=()
provides=(360.net)
conflicts=(browser360-stable-bin)
install=
source=("https://down.360safe.com/gc/signed_${_pkgname}_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('1e33160c51b3c19dc82fe9bd497640f95d1358353809e15f45871ca484796337')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp -r ${srcdir}/opt "${pkgdir}"
    #install qcert
    install -Dm644 "${srcdir}/opt/apps/com.360.browser-stable/files/components/professional.qcert" "${pkgdir}/var/lib/browser360/professional.qcert"
    #install icons
    for i in 16x16 24x24 32x32 48x48 64x64 128x128; do
    	install -Dm644 "${pkgdir}/opt/apps/com.360.browser-stable/files/product_logo_${i/x*}.png" \
    		"${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
    #install license
    install -Dm644 "${pkgdir}/opt/apps/com.360.browser-stable/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"
    #install desktop
    install -Dm 644 "${pkgdir}/opt/apps/com.360.browser-stable/entries/applications/com.360.browser-stable.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    #delete Potential non-FHS info page
    rm -rf ${pkgdir}/opt/apps/com.360.browser-stable/info
}
