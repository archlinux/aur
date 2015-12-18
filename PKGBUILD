# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.9.1
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/3173/trackmenot-${pkgver}-fx.xpi")
sha256sums=('97b122eb63fd293f8556cdee4319828e2f23d4f39b2fb1939f830141a95e88b3')

package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/trackmenot-${pkgver}-fx.xpi
  chmod -R 755 $dstdir
}
