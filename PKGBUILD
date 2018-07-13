# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: p2k <me@p2k-network.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: raingloom <raingloom42@gmail.com>
pkgname=wakfu-transition
pkgver=1.38
pkgrel=9
pkgdesc="A turn-based tactical Massively Multiplayer Online Role-playing Game (MMORPG) written in Java/OpenGL."
arch=('i686' 'x86_64')
url="http://www.wakfu.com/"
license=( "custom" )
depends=('libgl' 'libpng12' 'openal' 'openssl-1.0' 'java-environment' 'ankama-transition')
provides=('wakfu')
conflicts=('wakfu')
replaces=('wakfu')
install='wakfu.install'
source=('wakfu.desktop')
source_i686=('http://dl.ak.ankama.com/games/installers/wakfu-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/installers/wakfu-amd64.tar.gz')
sha512sums=('0f02ce4b83c4c7661f83dbcfd6544d1e3dede90dd11d8010c264a1d1b27f2717bb446637ce0451967a92d60e90740c7f750900ecc1e072cd3f58bde2eb00c9ad')
sha512sums_i686=('d9ab380a641a085c006a3bd70d912f1b8dd5dff93b906853b05dcb89ff2a8c6eb29f38a3c542d698d936856df116dd5bf1d4869f22e0983f7d2ec4487167725a')
sha512sums_x86_64=('5c9a8e2b8c712c203db6b20cbd717833be737b8859573ea9419fb4941fab74fe14e270004dc12e236439be950ee064df658832de3b70130c7b7ba7e5c8ddfdc4')

package() {
  msg2 'Installing launcher'
  _installdir="opt/ankama/wakfu"
  install -d "$pkgdir/usr/bin"
  ln -s "/$_installdir/Wakfu" "$pkgdir/usr/bin/wakfu"
  install -Dm644 wakfu.desktop "$pkgdir/usr/share/applications/wakfu.desktop"

  cd Wakfu

  msg2 'Installing icons'
  for _icon in game/updater_data/icons/game_icon_*.png
  do
    _size=$(basename $_icon | grep -o '[0-9]\+x[0-9]\+')
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/${_size}/apps/wakfu.png"
  done

  msg2 'Installing main application'
  install -d "$pkgdir/$_installdir"
  cp -a * "$pkgdir/$_installdir"
}
# vim:set ts=2 sw=2 et:
