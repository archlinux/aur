
# Contributor: Felix Golatofski <contact@xdfr.de>
_plugin_name="block-site"
_plugin_version=4.0.8.2
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
sha256sums=('5750ade9a710ea0db6f72cf67de70f214d3d2ec208c4a4d6a8dfd41bc51016ac')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  mv * $dstdir
}


