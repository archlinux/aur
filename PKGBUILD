# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="poddycast-bin"
pkgver=0.10.0
pkgrel=2
pkgdesc="Podcast app made with Electron, lots of ❤️ and ☕️"
arch=("aarch64" "armv7h" "i686" "x86_64")
url="https://github.com/MrChuckomo/poddycast"
license=('GPL3')
depends=('bash' 'electron22')
makedepends=('asar')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-armv7l.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-ia32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-x64.zip")
sha256sums=('a93b34e4df2f439a675769c355def5423ad102d96146e12a23f490674adf0135')
sha256sums_aarch64=('448c8c04c37fd87c0bcd4d3b037b6279582e22457c8d6f5224e761bf4e7d1824')
sha256sums_armv7h=('a1ff946d68f00676c1113cf9f72ed64fbe4e1e49901d14aa9c53ad169e006a7b')
sha256sums_i686=('9f3a8ae1429f65d1beb50b98e92015f77c959941527ada543a1e0477234bc731')
sha256sums_x86_64=('e3e8e4c3df091f94d042b355119d7474b7542a79d8d7c614774bfe35e0249d3d')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/Poddycast-linux-x64/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/resources/app/img/${pkgname%-bin}-app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    gendesk -f -n --icon "${pkgname%-bin}" --categories "Utility;AudioVideo" --name "Poddycast" --exec "/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}