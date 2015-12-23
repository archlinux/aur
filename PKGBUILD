
_plugin_name="block-site"
_plugin_version=1.1.8
_plugin_id=3145
pkgdesc="Automagically blocks websites of your choice."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/blocksite-${pkgver}-fx.xpi")
sha256sums=('46b43ff8b6ab8224f1aa02352a6a69f6e1b4c57c309e073967950e4e7385ccbc')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  mv * $dstdir
}


