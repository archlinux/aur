# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=treasure-chest
pkgname=${_pkgname}-bin
pkgver=5.5.0
pkgrel=1
pkgdesc='Full Node Wallet For Pirate Chain (ARRR)'
arch=('x86_64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
provides=('pirate-qt')
conflicts=('pirate-qt' 'pirate-cli')
depends=('boost-libs' 'libevent' 'miniupnpc' 'protobuf' 'qt5-base' 'qrencode' 'zeromq')
optdepends=('libappindicator-gtk3: system tray support'
            'libnotify: desktop notification support')

source=("${url}/releases/download/v${pkgver}/pirate-qt-ubuntu1804-v${pkgver}.deb"
        "COPYING")
sha256sums=('a063f1df2941f284d318b198faf2576cb98a61f2ee931caaf28cb16d3c877460'
            '011f6e7fa0238cff93eb3ea12b6b2743cdc7b3ee638570b6143a1f7bdfe1ba3e')

prepare() {
  tar -xf data.tar.xz
  # Fix .desktop Exec path
  sed -i 's/Exec=.*/Exec=\/usr\/bin\/pirate-qt %u/g' usr/share/applications/pirate-qt.desktop
}

package() {
  install -Dm755 usr/local/bin/pirate-qt "${pkgdir}/usr/bin/pirate-qt"
  install -Dm644 usr/share/applications/pirate-qt.desktop "${pkgdir}/usr/share/applications/pirate-qt.desktop"
  install -Dm644 usr/share/pixmaps/pirate.xpm "${pkgdir}/usr/share/pixmaps/pirate.xpm"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
