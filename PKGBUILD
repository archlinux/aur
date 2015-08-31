# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=useragentswitcher
_plugin_version=0.7.3
pkgdesc="Firefox extension to switch the User Agent"
license=('GPLv3')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=3
arch=('any')
url="http://chrispederick.com/work/user-agent-switcher/"
depends=("firefox>=4")
source=("https://addons.cdn.mozilla.net/storage/public-staging/59/user_agent_switcher-$pkgver-fx+sm.xpi")
md5sums=('d7f1f4b3689bf61c3d583432872a4cc2')
sha1sums=('d51cb250b9be11f21d569a7fdb6b7f23c4c277ce')
package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm $dstdir/user_agent_switcher-$pkgver-fx+sm.xpi
  chmod -R 755 $dstdir
}

