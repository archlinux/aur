# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_appname=com.360.browser-stable
pkgver=13.2.1032.87
pkgrel=1
pkgdesc="360 Browser stable version"
arch=("aarch64" "x86_64")
url="https://browser.360.net/gc/index.html?src=se"
license=('custom')
depends=('alsa-lib' 'at-spi2-core' 'nss' 'gtk3' 'gtk2' 'dbus' 'libxkbcommon' 'systemd-libs' 'glibc' 'gdk-pixbuf2' 'libx11' \
    'hicolor-icon-theme' 'libxext' 'libxcb' 'libxshmfence' 'libdrm' 'libxfixes' 'cairo' 'libxrandr' 'mesa' 'libcups' \
    'gcc-libs' 'libxdamage' 'nspr' 'libxcomposite' 'glib2' 'expat' 'pango' 'libxtst' 'libusb' 'openssl-1.1' 'sh')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://down.360safe.com/gc/signed_${_appname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://down.360safe.com/gc/signed_${_appname}_${pkgver}-1_amd64.deb")
source=("${pkgname%-bin}.install")
sha256sums=('a5fa1eaebb4b7302d5d1dbfe33934d8a10e5dc46cd5d7bec302a8dd9b8354664')
sha256sums_aarch64=('15172a47088f9cd10470a8fd90297da9afd4b73dca1435b9e0d6769c782c5f36')
sha256sums_x86_64=('38dd3fe0e9540b16fd5211e09f8100420629e47c014725a1de58de354f5719fa')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/professional.qcert" -t "${pkgdir}/var/lib/${pkgname%-bin}"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/professional.qcert" -t "${pkgdir}/apps-data/private/${_appname}"
    chmod 755 "${pkgdir}/apps-data/private/${_appname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128; do
    	install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/product_logo_${_icons/x*}.png" \
    		"${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png"
    done
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/apps/${_appname}/entries/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    rm -rf "${pkgdir}/opt/apps/${_appname}/info" "${pkgdir}/opt/apps/${_appname}/entries/autostart"
    chmod 0755 "${pkgdir}/opt/apps/${_appname}/files/${pkgname%-bin}_sandbox"
}