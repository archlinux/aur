# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pomodoro-bin
pkgver=1.8.2
pkgrel=2
pkgdesc="Pomodoro timer base on Electron."
arch=("x86_64")
url="https://github.com/AndrewMaksimchuk/pomodoro"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron25')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_1.8.1_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/AndrewMaksimchuk/pomodoro/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5a4cea8654d45cc371f79f7d4ccf52da86dd309b79285fd470999624968cd74a'
            '6c3be11c505c08a5a1a041f62fff718177de780c85e4e49609aa5ca22c2148a9'
            'a4117ffcb12e9b127117e07f2adb5f2be120161ce2d1d65cca39070a09d01961')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/pomodoro/resources/app" "${srcdir}/app.asar"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}