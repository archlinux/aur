# Maintainer: Lynx <wostarxi@outlook.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nfs-browser-bin
pkgver=6.0.0
pkgrel=1
pkgdesc="方德安全浏览器"
arch=(
    "aarch64"
    "x86_64"
)
url="https://browser.nfschina.com/se.html"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'nss'
)
options=(
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://browser.nfschina.com/download/flavor/aarch64/latest/linux_64")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://browser.nfschina.com/download/flavor/x86_64/latest/linux_64")
sha256sums_aarch64=('113890de65442f53336b38abf37ac7980cecef4e89093ee0e46468ed6646d774')
sha256sums_x86_64=('171c1ff9bd0ba985e6a4e1eeb3749602bf83386b7ea952d5b269513b138d30b1')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "/executable/d" -i "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16 22 24 32 48 64 128 256; do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/icons/product_logo_${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}