# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=myapp-scrapthatpage-bin
pkgver=1.0.0
_electronversion=23
pkgrel=8
pkgdesc="A desktop app that automates web scraper with easy to use script actions."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/kaushalmeena/myapp-scrapthatpage"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('396a63f91399afcaed82d7153e5ec61ca8169815934c98e6b20b50e1aa462c1b')
sha256sums_x86_64=('8695fc432cc4f8be29b53ebc773152809a5a7b407d55c1b92875c15ecfe9c9f1')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}