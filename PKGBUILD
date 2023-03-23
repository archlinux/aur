# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=13.2.1030.17
pkgrel=1
pkgdesc="360 Browser stable version"
arch=("x86_64")
url="https://browser.360.cn"
license=('custom')
depends=(alsa-lib at-spi2-core nss gtk3 gtk2 dbus libxkbcommon systemd-libs glibc gdk-pixbuf2 libx11 \
    hicolor-icon-theme libxext libxcb libxshmfence libdrm libxfixes cairo libxrandr mesa libcups \
    gcc-libs libxdamage nspr libxcomposite glib2 expat pango libxtst libusb openssl-1.1)
optdepends=()
provides=()
conflicts=(browser360-stable-bin)
install=
source=("https://down.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums=('ab5136481a48fd14d26347d80e047830752dc64c0479b51fa911c2c946052d5e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    rm -rf "${pkgdir}/apps-data" "${pkgdir}/opt/apps/${_pkgname}/info"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/files/components/professional.qcert" "${pkgdir}/var/lib/browser360/professional.qcert"
    for i in 16x16 24x24 32x32 48x48 64x64 128x128; do
    	install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/files/product_logo_${i/x*}.png" \
    		"${pkgdir}/usr/share/icons/hicolor/${i}/apps/${_pkgname}.png"
    done
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}