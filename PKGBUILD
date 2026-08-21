# Maintainer: Jahongir Ahmadaliev jahamarsi@gmail.com
pkgname=r7draw-desktop-bin
pkgver=26.1.2
pkgrel=1
pkgdesc="R7 Draw — diagram and flowchart editor by R7-Office"
arch=('x86_64')
url="https://gitlab.r7-office.ru/draw/r7draw-desktop"
license=('LicenseRef-Proprietary')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils'
         'at-spi2-core' 'util-linux-libs' 'libsecret' 'alsa-lib')
optdepends=('libappindicator-gtk3: system tray icon')
provides=('r7draw-desktop')
conflicts=('r7draw-desktop')
options=('!strip')
source=("https://download.r7-office.ru/r7graph/r7draw-desktop-amd64-${pkgver}.deb")
sha256sums=('dfa1b1a838e98261f4cb9495560a7c399e671e114de0a8161f6e10b973990514')

package() {
    tar xf data.tar.xz -C "${pkgdir}"

    chmod 4755 "${pkgdir}/opt/Р7-Графика/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/Р7-Графика/r7draw-desktop" "${pkgdir}/usr/bin/r7draw-desktop"

    sed -i \
        -e 's/^Name=.*/Name=R7 Draw/' \
        -e 's/^Comment=.*/Comment=Create flowcharts and diagrams/' \
        "${pkgdir}/usr/share/applications/r7draw-desktop.desktop"
}
