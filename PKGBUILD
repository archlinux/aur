# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=phiola-bin
pkgver=2.8.11
pkgrel=1
pkgdesc="Fast audio player, recorder, converter.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/stsaz/phiola"
license=('BSD-2-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'jack'
    'libpulse'
    'alsa-lib'
)
makedepends=(
    'icoutils'
)
options=(
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.tar.zst")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.zst::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-x86_64.tar.zst")
sha256sums=('6be792749954f9c1c53f9ec0cfe9764d1a678b378d411f5acd262318ef94a13f')
sha256sums_aarch64=('8d748a96c2992209f1f43aa02314c2d8cf30c928f6aecdbdb3cbc55788829bcb')
sha256sums_x86_64=('1b11908c652de8bb42ab81ba2e342a103e305047279937906b7b8a9ff73ad416')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\~\/bin\/${pkgname%-bin}-2\/mod\/gui\/${pkgname%-bin}.ico/${pkgname%-bin}/g" "${srcdir}/${pkgname%-bin}-2/mod/gui/${pkgname%-bin}.desktop"
    cp "${srcdir}/${pkgname%-bin}-2/${pkgname%-bin}-example.conf" "${srcdir}/${pkgname%-bin}-2/${pkgname%-bin}.conf"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/${pkgname%-bin}-2/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-2/mod/gui/${pkgname%-bin}.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "${srcdir}/${pkgname%-bin}-2/mod/gui/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-2/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}