# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=13.3.1010.201
pkgrel=1
pkgdesc="360 Browser stable version"
arch=(
    "aarch64"
    "x86_64"
)
url="https://browser.360.net/gc/index.html"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libdrm'
    'gtk3'
    'libxcomposite'
    'cairo'
    'nspr'
    'gdk-pixbuf2'
    'libxdamage'
    'nss'
    'gtk2'
    'libxtst'
    'mesa'
    'libpulse'
    'libx11'
    'expat'
    'libusb'
    'qt5-base'
    'libxext'
    'alsa-lib'
    'at-spi2-core'
    'pango'
    'hicolor-icon-theme'
    'openssl-1.1'
    'libxkbcommon'
    'libxfixes'
    'libxrandr'
    'systemd-libs'
    'libcups'
    'libxcb'
)
install="${pkgname%-bin}.install"
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://gedown.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://gedown.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('73f2fe5984117633d555cf7758bd5c7a14da9e3284de483b4391de49b6941bd0')
sha256sums_x86_64=('fdc89cb0ce0a07f67cf37449825060d9e7178fb211315c855d9d1fe2eaab2335')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    rm -rf "${srcdir}/opt/apps/${_pkgname}/info" \
        "${srcdir}/opt/apps/${_pkgname}/entries/autostart"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/professional.qcert" -t "${pkgdir}/var/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/professional.qcert" -t "${pkgdir}/apps-data/private/${_pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
