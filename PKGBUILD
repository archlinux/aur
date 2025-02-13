# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=strumpract-bin
_pkgname=StrumPract
pkgver=4.2.0
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
sha256sums_aarch64=('beaaab94acd37bf1bdbeb09da41e9a45ec49117f3521ff79c526a953dd92dbbd')
sha256sums_i686=('a5c3f933445be0e0e5fbb5abf4a451f436a4367c7b218816e4755b873da9d243')
sha256sums_x86_64=('e6a6b66dccc3aa17d53354d7724e8fa95932e18dc363b2a55bfb3c45ccabc5cc')
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