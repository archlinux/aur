# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: BryanLiang <liangrui.ch@gmail.com>
pkgname=spotifox-bin
_pkgname=Spotifox
pkgver=1.0.2
pkgrel=6
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
sha256sums_aarch64=('062cfb2f7d6c14458fe08e9a5ac32b4041d021835ee313c41836fb0f1fd306cc')
sha256sums_armv7h=('5c15d13f3f75a72f9db3a815bac68b80379cf0917e86ecf411b7ea345fcf3461')
sha256sums_x86_64=('23d3b1c97ce0407c7975b5bd5e8917e90486f52b50aa0b9c602658b6ea0fbba0')
build() {
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}_${pkgver}_linux_"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}