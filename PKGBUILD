# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=strumpract-bin
_pkgname=StrumPract
pkgver=4.4.0
pkgrel=1
pkgdesc="Various tools for musicians.(Prebuilt version)"
arch=(
    'aarch64'
    'i686'
    'x86_64'
)
url="https://github.com/fredvs/strumpract"
license=('LGPL-2.1-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'pipewire-jack'
    'libvorbis'
    'libogg'
    'libx11'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver//./_}_linux_rpi-aarch64.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver//./_}_linux_i386.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver//./_}_linux_amd64.zip")
sha256sums_aarch64=('66924c34eb209ad5f896daee2854ce2cdb89fcd0268084e475e1a656f52e5748')
sha256sums_i686=('2fc6d75892615a1a498b8b1ede407e6a2dcbfa1e1f66d125cdd3cbd7a9fbf2cc')
sha256sums_x86_64=('f77835adaadb65cb3f78a95b5c97798639b450753dd122c9c71a068f0fb5424a')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_"*/"${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}