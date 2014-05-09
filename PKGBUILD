# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
_plugin_name=addonbar
_plugin_version=3.2
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Gives you a place to put all your add-on buttons without over-crowding the navigation bar."
license=('MIT')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/the-addon-bar/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/storage/public-staging/473193/the_addon_bar_restored-3.2-fx.xpi")
md5sums=('237a158e104406c04e3bfd600176898b')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/the_addon_bar_restored-3.2-fx.xpi
  chmod -R 755 $dstdir
}
