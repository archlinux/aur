# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_appname=com.360.browser-stable
pkgver=13.2.1031.22
pkgrel=1
pkgdesc="360 Browser stable version"
arch=("x86_64")
url="https://browser.360.net/gc/index.html?src=se"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'nss' 'gtk3' 'gtk2' 'dbus' 'libxkbcommon' 'systemd-libs' 'glibc' 'gdk-pixbuf2' 'libx11' \
    'hicolor-icon-theme' 'libxext' 'libxcb' 'libxshmfence' 'libdrm' 'libxfixes' 'cairo' 'libxrandr' 'mesa' 'libcups' \
    'gcc-libs' 'libxdamage' 'nspr' 'libxcomposite' 'glib2' 'expat' 'pango' 'libxtst' 'libusb' 'openssl-1.1' 'sh')
optdepends=()
provides=()
conflicts=("${pkgname%-bin}")
install=
source=("${pkgname%-bin}-${pkgver}.deb::https://down.360safe.com/gc/signed_${_appname}_${pkgver}-1_amd64.deb")
sha256sums=('8dada6f9ad9bc61f0de6c96e2142cb44af14b42c64347509a2af845bc947cecb')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info" "${pkgdir}/opt/apps/com.360.browser-stable/entries/autostart"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/professional.qcert" -t "${pkgdir}/var/lib/browser360"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/professional.qcert" -t "${pkgdir}/apps-data/${_appname}"
    chmod 755 "${pkgdir}/apps-data/private/${_appname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128; do
    	install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/product_logo_${_icons/x*}.png" \
    		"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png"
    done
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    chmod 0755 "${pkgdir}/opt/apps/com.360.browser-stable/files/browser360_sandbox"
}