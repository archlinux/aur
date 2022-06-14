# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgbase=pirate
pkgname=("${pkgbase}-qt-bin" "${pkgbase}-cli-bin")
pkgver=5.5.0
pkgrel=1
pkgdesc="Pirate Chain (ARRR) - Untraceable, Anonymous, Private Cryptocurrency"
arch=('x86_64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
groups=('pirate')

depends=('boost-libs' 'libevent' 'miniupnpc' 'protobuf' 'zeromq')
makedepends=('desktop-file-utils')
optdepends=('libappindicator-gtk3: system tray support'
            'libnotify: desktop notification support')
conflicts=('treasure-chest' 'treasure-chest-bin')
replaces=('treasure-chest' 'treasure-chest-bin')

source=("${pkgbase}-qt-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgbase}-qt-ubuntu1804-v${pkgver}.zip"
        "${pkgbase}-cli-v${pkgver}.zip::${url}/releases/download/v${pkgver}/${pkgbase}-cli-ubuntu1804-v${pkgver}.zip"
        "${pkgbase}-qt.desktop"
        "${pkgbase}.xpm"
        "COPYING")

sha256sums=('6e5687f86b9912dc03d7eab110683e03e9868c915446f7878e52c2b649027d23'
            'c3330e24332ac01a198632caa2541205726788c5eb49bf8c74d2f095eeee314e'
            'db1875d7ef83e3b4d69a83a39acbb0e6c5092f1a0919b3c8c94cabdf62232191'
            'ae5d7ccbb18a07c794091a4294cca3b260f9b49ecf70a53279da2c0a3c654e18'
            '011f6e7fa0238cff93eb3ea12b6b2743cdc7b3ee638570b6143a1f7bdfe1ba3e')

package_pirate-qt-bin() {
  # Package Pirate QT GUI
  pkgdesc+=" - GUI"
  depends+=('hicolor-icon-theme' 'qt5-base' 'qrencode')
  optdepends=('libappindicator-gtk3: system tray support'
              'libnotify: desktop notification support')
  provides=('pirate-qt')

  install -Dm755 ${pkgbase}-qt-linux "${pkgdir}/usr/bin/${pkgbase}-qt"
  install -Dm644 ${pkgbase}.xpm "${pkgdir}/usr/share/pixmaps/${pkgbase}.xpm"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}-qt/COPYING"
  desktop-file-install --dir="${pkgdir}/usr/share/applications" ${pkgbase}-qt.desktop
}

package_pirate-cli-bin() {
  # Package Pirate CLI
  pkgdesc+=" - CLI"
  provides=('pirate-cli' 'pirate-tx' 'pirated')

  install -Dm755 ${pkgbase}-cli "${pkgdir}/usr/bin/${pkgbase}-cli"
  install -Dm755 ${pkgbase}-tx "${pkgdir}/usr/bin/${pkgbase}-tx"
  install -Dm755 ${pkgbase}d "${pkgdir}/usr/bin/${pkgbase}d"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}-cli/COPYING"
}
