# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
pkgname=spotifox-bin
_pkgname=Spotifox
pkgver=1.1.0
pkgrel=1
pkgdesc='Yet another spotify CLI client similar to go-musicfox. (Precompiled version)'
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url='https://github.com/go-musicfox/spotifox'
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'glibc'
    'alsa-lib'
)
makedepends=(
    'gendesk'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/go-musicfox/spotifox/v${pkgver}/LICENSE"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/go-musicfox/spotifox/v${pkgver}/previews/logo.png"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.zip")

sha256sums=('20535828272932407c2f5172aeb714ac7b374a34e5ecb1825af509f2902cde54'
            'c5be3b8375d0cff7661a7283c0e03b64f696059346a3441c79b41e28368aed24')
sha256sums_aarch64=('1f151ea71bf8eb0f0f7dfe0c85bd1ca357b2a3712dfa98050f71e8d1a10fa4b2')
sha256sums_armv7h=('dd374fb97ec7220cf6dd1425fbfcaed4c84716baa5f0bbfe8c72f23bcf41e70f')
sha256sums_x86_64=('4177f9fbd9758cd7ef2247b2052b80d13b41d1ea939b7dad9e0acf619cf9537f')
build() {
    gendesk -q -f -n --pkgname="${pkgname%-bin}" --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}