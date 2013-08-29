# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>

_plugin_name=https-everywhere
_plugin_version=3.4.1
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Plugin for firefox which ensures you are using https whenever it's possible."
license=('GPL2')
arch=('any')
url="https://www.eff.org/https-everywhere"
depends=("firefox")
source=("https://www.eff.org/files/https-everywhere-${_plugin_version}.xpi")
md5sums=('1d0d82fb1235ceb79a29c3100b131687')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/https-everywhere-${_plugin_version}.xpi
  chmod -R 755 $dstdir
}
