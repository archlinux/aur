# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=strumpract-bin
_pkgname=StrumPract
pkgver=3.6.0
pkgrel=1
pkgdesc="Various tools for musicians."
arch=(
    "aarch64"
    "i686"
    "x86_64"
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
sha256sums_aarch64=('337e7db15298fb30eb5ffbe61d0f3ea9f10a7f0bef33e26e41f981acd12e1ef0')
sha256sums_i686=('34235446c24720569d73d9ecb761b45807505707e8708557cf277e26c408a06d')
sha256sums_x86_64=('c8d3906777cfbf72862d63a897aeaf280dc01d60f891e1324fb9fab5a9b950cf')
build() {
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_"*/* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_"*/"${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}