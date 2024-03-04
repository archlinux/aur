# Maintainer: drws
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=qradiolink-bin
pkgver=0.8.11_1
pkgrel=2
pkgdesc='Multimode SDR transceiver for GNU radio'
arch=('x86_64')
url="http://qradiolink.org/"
_githuburl="https://github.com/qradiolink/qradiolink"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-multimedia'
    'libjpeg6-turbo'
    'zeromq'
    'qt5-base'
    'libsndfile'
    'glibc'
    'opus'
    'gcc-libs'
    'gnuradio==3.8.2.0'
    'xdg-utils'
    'libconfig9'
    'log4cpp'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/${pkgver//_/-}/${pkgname%-bin}_${pkgver//_/-}_amd64.deb"
    "${pkgname%-bin}.desktop::https://raw.githubusercontent.com/qradiolink/qradiolink/next/qradiolink.desktop"
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/qradiolink/qradiolink/next/src/res/icon.png"
)
sha256sums=('2b98d35fc0cc4844cf4034b5a86f458dedc9735e9447bf19ae3e423c6eb52c3f'
            'ce3f6b3a7feb7ca33a20e79cb46c71c5ba6eee0ba17d06ff58518bd6bb475d18'
            '8b3f35dfd1b0954a4cb2fafc5479cbda92caab46bf31b620cf33206ccf9929e5')
build() {
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/"* -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/man/man1/${pkgname%-bin}.1.gz" -t "${pkgdir}/usr/share/man/man1"
    sed "s|icon|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}