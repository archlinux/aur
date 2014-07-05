# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=live-http-headers
_plugin_version=0.17
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="View HTTP headers of a page and while browsing."
license=('GPL2')
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/live-http-headers/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/3829/addon-3829-latest.xpi")
md5sums=('2683d3b32f085901c71566d4649b2626')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/addon-3829-latest.xpi
  chmod -R 755 $dstdir
}
