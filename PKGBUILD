# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

_plugin_name=keefox
pkgname=firefox-extension-$_plugin_name
pkgver=1.5.4
pkgrel=1
pkgdesc="Adds free, secure and easy to use password management features to Firefox"
arch=('any')
url="http://keefox.org"
license=('GPL2')
depends=('firefox' 'keepass-plugin-rpc')
source=("https://addons.mozilla.org/firefox/downloads/latest/306880/platform:2/addon-306880-latest.xpi")
sha256sums=('f373a2896036cddd4936f4779b9da83b68f0d01133e8416eda479bdf40ad52a9')

package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  rm "$dstdir/addon-306880-latest.xpi"
  chmod 644 "$dstdir"/META-INF/*
}
