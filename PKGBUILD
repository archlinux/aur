# Maintainer: skrewball <skrewball at joickle dot com>

pkgname=treasure-chest-bin
pkgver=5.4.2
pkgrel=1
pkgdesc='Full Node Wallet For Pirate Chain (ARRR)'
arch=('x86_64')
url='https://github.com/PirateNetwork/pirate'
license=('MIT')
provides=('pirate-qt')
conflicts=('pirate-qt' 'pirate-cli')
depends=(
	'boost-libs'
	'hicolor-icon-theme'
	'libevent'
	'miniupnpc'
	'protobuf'
	'qt5-base'
	'qrencode'
	'zeromq')
optdepends=('libappindicator-gtk3: system tray support'
	'libnotify: desktop notification support')
source=("https://github.com/PirateNetwork/pirate/releases/download/v${pkgver}/pirate-qt-ubuntu1804-v${pkgver}.deb")
sha256sums=('ba480a2fa45a0776814b10a8270fbd8bb25f9a098cf9dabd331a6d2fee9da2f4')

prepare() {
  tar -xf data.tar.xz
  # Fix .desktop Exec path for Arch
  sed -i 's/Exec=.*/Exec=\/usr\/bin\/pirate-qt %u/g' usr/share/applications/pirate-qt.desktop
}

package() {
  install -Dm755 usr/local/bin/pirate-qt "${pkgdir}/usr/bin/pirate-qt"
  install -Dm644 usr/share/applications/pirate-qt.desktop "${pkgdir}/usr/share/applications/pirate-qt.desktop"
  install -Dm644 usr/share/pixmaps/pirate.xpm "${pkgdir}/usr/share/pixmaps/pirate.xpm"
}
