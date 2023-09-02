# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nativefier-gui-bin
pkgver=0.9.0
pkgrel=1
pkgdesc="Graphical user interface for nativefier. Make any web page a desktop application."
arch=("aarch64" "armv7h" "x86_64")
url="https://mattruzzi.github.io/nativefier-gui/"
_githuburl="https://github.com/mattruzzi/nativefier-gui"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron26')
makedepends=('asar' 'gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_githuburl}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('d437c440bc6f70fc1d522e74392bef52767c02a79f9da2235fd58940a1dffd8d')
sha256sums_aarch64=('7e0f3055aab320dd7b337dc1cf8f222c3b023e7495265b90bc9e0b4d5834cb26')
sha256sums_armv7h=('d4b35c11f7e27e96fa8602c05eb70df7a86829b72799a9da6b949ea656872c79')
sha256sums_x86_64=('646a5400588a25186361eeab27282e6a4a28edc400e1585a5dee48a8c72c6360')
prepare() {
    asar p "${srcdir}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    gendesk -f -n --categories "Development;Utility" --name "${pkgname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}