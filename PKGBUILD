# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=rusty-psn-bin
pkgver=0.5.10
pkgrel=1
pkgdesc="A GUI/CLI tool for downloading PS3 and PS4 game updates"
provides=("rustypsn")
arch=('x86_64')
url="https://github.com/RainbowCookie32/rusty-psn"
license=("Apache")

source=(
    "${pkgname}-cli-${pkgver}.zip::https://github.com/RainbowCookie32/rusty-psn/releases/download/v${pkgver}/rusty-psn-cli-linux.zip"
    "${pkgname}-gui-${pkgver}.zip::https://github.com/RainbowCookie32/rusty-psn/releases/download/v${pkgver}/rusty-psn-egui-linux.zip"
    "rusty-psn.desktop"
    "playstation-store.svg"
)

sha256sums=('07015310e38adc7a8b0d1e13c4eb5eab2d6bf212d97d4110ec5e22d52da93f42'
            '46c66e53d3f8ffc8939cf05ed908109ce38d8212d5f7b8bb7692fbb4d446e7a7'
            '2cb6715bb0cf3646091369385e285c92a2573f1602580f60a51d5c0ea8e638a5'
            '4c6f59e5d15a93b76fc1a90ca4f8283193a870627a958eff62cda952474d089b')

options=("!strip")

package() {
    install -o root -g root -m 755 -d "${pkgdir}/usr/bin"
    install -o root -g root -m 755 -d "${pkgdir}/usr/share/applications"
    install -o root -g root -m 755 -d "${pkgdir}/usr/share/pixmaps"

    unzip "${pkgname}-cli-${pkgver}.zip" -d "${pkgdir}/usr/bin"
    chmod 0755 "${pkgdir}/usr/bin/rusty-psn"

    install -o root -g root -m 755 "${srcdir}/rusty-psn" "${pkgdir}/usr/bin/rusty-psn-gui"
    install -o root -g root -m 644 "${srcdir}/rusty-psn.desktop" "${pkgdir}/usr/share/applications/rusty-psn.desktop"
    install -o root -g root -m 644 "${srcdir}/playstation-store.svg" "${pkgdir}/usr/share/pixmaps/playstation-store.svg"

}
