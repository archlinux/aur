# Maintainer: Eduard Tanase <eduard dot tanase1 at gmail dot com>
pkgname=openbci-gui
pkgver=5.2.2
pkgrel=2
pkgdesc="A cross platform application for the OpenBCI Cyton and Ganglion."
arch=('x86_64')
url="https://github.com/OpenBCI/OpenBCI_GUI"
license=('MIT')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}-${pkgrel}-x86_64.zip::https://github.com/OpenBCI/OpenBCI_GUI/releases/download/v${pkgver}/openbcigui_v${pkgver}_2023-08-21_16-14-34_linux64.zip"
        "openbci-gui.desktop"
        "openbci-gui.sh"
        "${pkgname}-${pkgver}-${pkgrel}-LICENSE::https://raw.githubusercontent.com/OpenBCI/OpenBCI_GUI/master/LICENSE")
sha256sums=('fe3fa1ef45eda3140f949279dac1c3421aaf95ce2696cd26d47e896338e5e8fb'
            'a27f71d4b58b218c60904e79b4e9fcd535cddfeb1d9f17f8b180e16e4292e670'
            '7740180532f6092fe543cb2138af21a437ddf921c73f265fedab3ea7ab37b157'
            'SKIP')

package() {
  # Install license
  install -Dm 644 "${pkgname}-${pkgver}-${pkgrel}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install logo
  install -Dm 644 "${srcdir}/OpenBCI_GUI/data/obci-logo-blu-cog.png" "${pkgdir}/usr/share/pixmaps/openbci-gui.png"

  # Move files to opt directory
  install -dm 755 "${pkgdir}/opt"
  mv "${srcdir}/OpenBCI_GUI" "${pkgdir}/opt/${pkgname}"

  # Install run script
  install -Dm 755 openbci-gui.sh "${pkgdir}/usr/bin/openbci"

  # Install desktop app
  install -Dm 644 openbci-gui.desktop "${pkgdir}/usr/share/applications/openbci-gui.desktop"
}
