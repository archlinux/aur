# Maintainer:  Rubin Simons <me@rubin55.org>

pkgname=rusty-psn-bin
pkgver=0.5.6
pkgrel=3
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

sha256sums=('a35f5edca4b5f54864b428fadb69ddbb2d787ef01ef88b42708c3cff3056ada4'
            '84755002e3e6ac15d28cceaef35325c39cc1855715b68fb789ebd6104bfe8feb'
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
