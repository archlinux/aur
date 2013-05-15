# Maintainer: Vain <aurmaint1 on host: uninformativ dot de>

_plugin_name=overbite
_plugin_version=3.0.1627
_plugin_id=7685
pkgdesc="Gopher plugin for Firefox"
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox>=21.0")
source=("https://addons.mozilla.org/firefox/downloads/latest/$_plugin_id/addon-$_plugin_id-latest.xpi")
md5sums=('9cee021eb8089cc3ba6f04f7e75bb5fb')

package() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  dstdir=$pkgdir/usr/lib/firefox/browser/extensions/$emid
  install -d "$dstdir"
  mv * "$dstdir"
  rm "$dstdir"/*.xpi
}
