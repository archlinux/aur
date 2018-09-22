# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>
# Contributor: Genesis <tofupedia.fr@gmail.com>

pkgname=dofus-beta
pkgver=2.48
pkgrel=1
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR (Beta version).'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus-beta.install'
depends=('libpng12' 'wine')

source=('dofus-beta.desktop'
        'dofus-beta.sh')
source_i686=('http://dl.ak.ankama.com/games/installers/beta/dofus-beta-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/installers/beta/dofus-beta-amd64.tar.gz')
md5sums=('0e797e4fcf39e1d06f68b51bfd215040'
         'c30ea01c11808930ae968e09272929d5')
md5sums_i686=('01ce4e20df355f9a5724ef5c5b880cbf')
md5sums_x86_64=('7566e58290a158e12156ef8ab608c7d0')

package() {
  msg2 'Installing main applications...'
  installdir='opt/ankama/dofus-beta'
  install -d "$pkgdir/$installdir"
  cp -r "$srcdir/DofusBeta/"* "$pkgdir/$installdir"

  msg2 'Setting up game file permissions...'
  chgrp -R games "$pkgdir/$installdir"
  chmod -R g+w "$pkgdir/$installdir"

  msg2 'Installing launcher...'
  install -Dm755 "$srcdir/dofus-beta.sh" "$pkgdir/usr/bin/dofus-beta"
  install -Dm644 "$srcdir/dofus-beta.desktop" "$pkgdir/usr/share/applications/dofus-beta.desktop"

  msg2 'Installing icons...'
  for icon in "$srcdir/DofusBeta/share/updater_data/icons/game_icon_"*'.png'
  do
    size="$(basename "$icon" | grep -o '[0-9]\+x[0-9]\+')"
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$size/apps/dofus-beta.png"
  done
}

# vim:set ts=2 sw=2 et:
