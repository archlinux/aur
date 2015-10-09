
_plugin_name=image-block
_plugin_version=2.1
_plugin_id=5613
pkgdesc="FoxyProxy is an advanced proxy management tool that completely replaces Firefox's limited proxying capabilities."
license=('GPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/$_plugin_id"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/${_plugin_id}/imageblock-${pkgver}-fx.xpi")
sha256sums=('2d75151da2aedd81c415c1da439e7bdbe823abab9a85ccd3f578a2828a415765')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>50</em:maxVersion>#' install.rdf
  rm *.xpi
  mv * $dstdir
}


