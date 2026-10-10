# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=browser360-bin
_pkgname=com.360.browser-stable
pkgver=13.4.1140.88
pkgrel=1
pkgdesc="360 Browser stable version"
arch=(
    'aarch64'
    'x86_64'
)
url="https://browser.360.net/gc/index.html"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-base'
    'alsa-lib'
    'gtk3'
    'gtk2'
    'nss'
    'dmidecode'
    'libxcrypt-compat'
    'libcanberra'
)
install="${pkgname%-bin}.install"
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://gedown.360safe.com/gc/${pkgname%-bin}-cn-stable_${pkgver}-1_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://gedown.360safe.com/gc/signed_${_pkgname}_${pkgver}-1_amd64.deb")
sha256sums_aarch64=('a8f84b44c771206f3d5cb4c97183f29af28d2825e55c36d98662513cebcf3f74')
sha256sums_x86_64=('fc9be736386d488272e6b8a92383c9384a897d98816968bede6d90e2373d2475')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    rm -rf  "${srcdir}/opt/apps/${_pkgname}/info" \
            "${srcdir}/opt/apps/${_pkgname}/entries/autostart"
}
package() {
    cp -a "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/professional.qcert" -t "${pkgdir}/var/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/professional.qcert" -t "${pkgdir}/apps-data/private/${_pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png"
    done
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/files/components/procopyright.html" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/opt/apps/${_pkgname}/entries/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
