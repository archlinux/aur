# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: p2k <Patrick.Schneider@uni-ulm.de>
# Contributor: Schtroumpfette <fpeterschmitt@voila.fr>

pkgname=dofus-beta
pkgver=2.21
pkgrel=2
pkgdesc='A manga inspired, Massively Multiplayer Online Role-playing Game (MMORPG) for Adobe AIR  (Beta version).'
arch=('i686' 'x86_64')
url='http://www.dofus.com/'
license=('custom:Dofus License')
install='dofus-beta.install'
backup=('opt/ankama/dofus-beta/transition.conf')
depends=('ankama-transition>=3.8.1-3' 'adobe-air-sdk')
depends_i686=('gtk2' 'alsa-lib')
depends_x86_64=('lib32-gtk2' 'lib32-alsa-lib')

source=('dofus-beta.sh'
        'dofus-beta.desktop'
        'air-generic-launcher.sh'
        'transition.conf')
source_i686=('http://dl.ak.ankama.com/games/dofus2-beta/setup/setup-beta-transition-x86.tar.gz')
source_x86_64=('http://dl.ak.ankama.com/games/dofus2-beta/setup/setup-beta-transition-amd64.tar.gz')

md5sums=('91023d67a519421912b3d101ded7ca12'
         '0e797e4fcf39e1d06f68b51bfd215040'
         'f179eaa5e6e6674b1853cf826fc33c3a'
         'a80f74d45dc98aed9cb8436b775bd0ad')
md5sums_i686=('7dac81b01102aeafc0664e0e5e1d7106')
md5sums_x86_64=('2daef0db4643b34688ba67793412f07b')

package() {
  _installdir="$pkgdir/opt/ankama/dofus-beta"
  install -d "$_installdir"

  cd "$srcdir"
  msg2 'Installing menu entry...'
  install -Dm755 'dofus-beta.sh' "$pkgdir/usr/bin/dofus-beta"
  install -Dm644 'dofus-beta.desktop' "$pkgdir/usr/share/applications/dofus-beta.desktop"
  install -Dm644 'DofusBeta/share/icon/dofus-icon-128.png' "$pkgdir/usr/share/pixmaps/dofus-beta.png"

  msg2 'Installing main applications...'
  mv "DofusBeta/"{bin,share} "$_installdir"
  install -Dm644 transition.conf "$_installdir"

  msg2 'Setting up game file permissions...'
  chgrp -R games $_installdir
  chmod -R g+w $_installdir
  chmod 666 "$_installdir/share/META-INF/AIR/application.xml"

  msg2 'Installing adl based launchers...'
  install -Dm755 'air-generic-launcher.sh' "$_installdir/bin"
  install -Dm755 'air-generic-launcher.sh' "$_installdir/share/reg/bin"

  msg2 'Installing transition update file...'
  ln -s '/opt/ankama/transition/' "$_installdir/transition"
}

# vim:set ts=2 sw=2 et:
