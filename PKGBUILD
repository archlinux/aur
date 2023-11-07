# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=poddycast-bin
_pkgname=Poddycast
pkgver=0.11.0
pkgrel=2
pkgdesc="A Podcast app made with Electron, lots of ❤️ and ☕️"
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://github.com/MrChuckomo/poddycast"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron22'
)
makedepends=(
    'gendesk'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-armv7l.zip")
source_i686=("${pkgname%-bin}-${pkgver}-i686.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-ia32.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${url}/releases/download/v${pkgver}/Poddycast-linux-x64.zip")
sha256sums=('a00d29a2264aa2fa31e3ddecc52643a3924fcda917e25953c1ba73fbd55a952c')
sha256sums_aarch64=('35f4d7a1a43c950a4eb4a242eda4f9442539467364d62aac3c74d837db4983ef')
sha256sums_armv7h=('a29309aa3b2e9c6507404c0d9298350fbe93ca88a6ca13b117782aeb0db3a167')
sha256sums_x86_64=('1b5e2ff12ff8af90a021e70ed8e1f8c2439a16488476252e3b078b9cac4da8a9')
build() {
    gendesk -q -f -n --categories "AudioVideo" --name "${_pkgname}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/Poddycast-linux-x64/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/Poddycast-linux-x64/resources/app/img/${pkgname%-bin}-app_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}