# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=13.3.1013.37
pkgrel=1
pkgdesc="360 Browser stable version"
arch=(
    "aarch64"
    "x86_64"
)
url="https://browser.360.net/gc/index.html"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'alsa-lib'
    'openssl-1.1'
    'gtk2'
    'gtk3'
    'nss'
    'libpulse'
    'libusb'
)
install="${pkgname%-bin}.install"
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://gedown.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://gedown.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('6a60c820fa55d10065680f7ee5a88735afb54a41617658d3a863a21802248825')
sha256sums_x86_64=('19f33e0d27afa540637c973d78affe8c586d5823ceec1599aeff5da89a77b8b1')
build() {
    bsdtar -xf "${srcdir}/data."*
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