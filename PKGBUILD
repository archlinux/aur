# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=strumpract-bin
_pkgname=StrumPract
pkgver=3.8.0
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
sha256sums_aarch64=('a0628787e91d202367c4783dc1fa7cf4f311e40c0b0d5172378167f8f050e41d')
sha256sums_i686=('fb2f9da1de81af313298301ef6c540097584ecc11ecfe2cc76a818f4af54dc0e')
sha256sums_x86_64=('478d4e52985cd97a3c39e0b2da0584208394faa7ef44c951356e42270fb05db0')
build() {
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/${_pkgname}_"*/* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}_"*/"${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}