# Maintainer: drws
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=qradiolink-bin
pkgver=0.8.9_1
pkgrel=3
pkgdesc='Multimode SDR transceiver for GNU radio'
arch=('x86_64')
url="http://qradiolink.org/"
_githuburl="https://github.com/qradiolink/qradiolink"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('qt5-multimedia' 'protobuf' 'libjpeg6-turbo' 'zeromq' 'qt5-base' 'libsndfile' 'glibc' 'opus' 'gcc-libs' 'gnuradio==3.8.2.0' 'xdg-utils' 'libconfig9' 'log4cpp')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "${pkgname%-bin}.desktop::https://raw.githubusercontent.com/qradiolink/qradiolink/next/qradiolink.desktop"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/qradiolink/qradiolink/next/src/res/icon.png")
sha256sums=('b8050fc8dd0787c45236920a2dd81d2d0c395ab239191f1ae6632994aa780350'
            'ce3f6b3a7feb7ca33a20e79cb46c71c5ba6eee0ba17d06ff58518bd6bb475d18'
            '8b3f35dfd1b0954a4cb2fafc5479cbda92caab46bf31b620cf33206ccf9929e5')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    sed "s|icon|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}