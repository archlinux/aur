# $Id: PKGBUILD,v 1.8 2008/03/22 15:29:44 dan Exp $
# Maintainer: Dan McGee <dan@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.3.0
pkgrel=1
pkgdesc="A Plugin Pack for Pidgin"
arch=(i686 x86_64)
url="http://plugins.guifications.org/trac/wiki/PluginPack"
license=('GPL2')
depends=('pidgin' 'glib2')
makedepends=('perlxml')
replaces=('gaim-plugin-pack')
options=(!libtool)
source=(http://downloads.guifications.org/plugins/Plugin%20Pack/purple-plugin_pack-$pkgver.tar.bz2)
md5sums=('32a297e854341c5b043a5325ee6f0819')

build() {
  cd $startdir/src/purple-plugin_pack-$pkgver
  ./configure --prefix=/usr
  # kill a few plugins that we don't want built
  rm xmmsremote/.build || return 1
  rm talkfilters/.build || return 1
  # reconfigure without these plugins (seems to not work if you don't
  # run configure twice)
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install

  # xmms plugin just doesn't want to disappear cleanly (starting in 2.0.0)
  rm -rf $startdir/pkg/usr/share/pixmaps/
}
