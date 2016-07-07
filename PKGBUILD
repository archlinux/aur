# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: p2k <me@p2k-network.org>
# Contributor: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: raingloom <raingloom42@gmail.com>
pkgname=wakfu-transition
pkgver=1.38
pkgrel=2
pkgdesc="A turn-based tactical Massively Multiplayer Online Role-playing Game (MMORPG) written in Java/OpenGL."
arch=('i686' 'x86_64')
url="http://www.wakfu.com/"
license=( "custom" )
depends=('libglapi' 'openal' 'java-environment' 'ankama-transition')
provides=('wakfu')
conflicts=('wakfu')
replaces=('wakfu')
install='wakfu.install'
source=('wakfu.sh'
        'wakfu.desktop'
        'transition.conf.patch')
source_i686=('http://dl.ak.ankama.com/games/installers/wakfu-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/installers/wakfu-amd64.tar.gz')
sha512sums=('790310d136dce42ee801281697257a1e2201875a4df72398eb94c9bd6f69e187f4c35c9d7b0462470b918cc0c0ca769b41ca4743a15e8d32bbf4fb2e62b813d5'
            '0f02ce4b83c4c7661f83dbcfd6544d1e3dede90dd11d8010c264a1d1b27f2717bb446637ce0451967a92d60e90740c7f750900ecc1e072cd3f58bde2eb00c9ad'
            '63dab2a596fcfc6aa393ae2af3bd7c54b56db5f3e47f32674b9e981e336b1b9053481604143d6fec4d93405fa60df531546d07db08df85cb5915f5f9edd1e1d9')
sha512sums_i686=('d9ab380a641a085c006a3bd70d912f1b8dd5dff93b906853b05dcb89ff2a8c6eb29f38a3c542d698d936856df116dd5bf1d4869f22e0983f7d2ec4487167725a')
sha512sums_x86_64=('5c9a8e2b8c712c203db6b20cbd717833be737b8859573ea9419fb4941fab74fe14e270004dc12e236439be950ee064df658832de3b70130c7b7ba7e5c8ddfdc4')

prepare() {
  patch -p0 < transition.conf.patch
}

package() {
  install -Dm755 wakfu.sh "$pkgdir/usr/bin/wakfu"
  install -Dm644 wakfu.desktop "$pkgdir/usr/share/applications/wakfu.desktop"
  cd Wakfu

  msg2 'Installing icons'
  for _icon in game/updater_data/icons/game_icon_*.png
  do
    _size=$(basename $_icon | grep -o '[0-9]\+x[0-9]\+')
    install -Dm644 "$_icon" "$pkgdir/usr/share/icons/hicolor/${_size}/apps/wakfu.png"
  done

  msg2 'Installing main application'
  _installdir="opt/ankama/wakfu"
  install -d "$pkgdir/$_installdir"
  cp -ar game "$pkgdir/$_installdir"
  install -m644 transition.conf "$pkgdir/$_installdir"
  ln -s /opt/ankama/transition "$pkgdir/$_installdir"
}
# vim:set ts=2 sw=2 et:
