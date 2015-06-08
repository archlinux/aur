# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=tab-scope
_plugin_version=1.6.1
_plugin_id=4882
pkgdesc="Preview and navigate tab contents through popup"
license=('MPL')

pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/tab-scope/?src=search"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/4882/addon-4882-latest.xpi")
md5sums=('d2f0a4ef3013451b0debf59712418f3b')

prepare() {
  cd $srcdir

  # Ugly hack, bsdtar does not extract the xpi properly...
  unzip -qqo ../addon-4882-latest.xpi
}

package() {
  cd $srcdir

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}

  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/addon-4882-latest.xpi
  chmod -R 755 $dstdir
}
