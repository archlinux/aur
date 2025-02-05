# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=strumpract-bin
_pkgname=StrumPract
pkgver=4.0.0
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
sha256sums_aarch64=('68ca19d25653a10ce500947ac3ef2c6c5cfdbcbba9ec73a73b4becd61a81d0be')
sha256sums_i686=('3b9afa4fd80f9f54bc6ae43bb636c2f07c3ddaaaf364e157a6cb26619b09f8bb')
sha256sums_x86_64=('0361cfa3c95bae04ed768c26f42f7163d93f96b47e58828c894937e01ad02d91')
prepare() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --pkgdesc="${pkgdesc}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}_"*/* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_"*/"${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}