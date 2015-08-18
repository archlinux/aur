# Maintainer: Marcel Korpel <marcel[dot]korpel[at]gmail>

_plugin_name=keefox
pkgname=firefox-extension-$_plugin_name
pkgver=1.4.8.1_signed
pkgrel=1
pkgdesc="Adds free, secure and easy to use password management features to Firefox"
arch=('any')
url="http://keefox.org"
license=('GPL2')
depends=('firefox' 'keepass')
source=("https://addons.mozilla.org/firefox/downloads/latest/306880/platform:2/addon-306880-latest.xpi")
sha256sums=('f5e058bc45a6e6fb419d24eb09a58b571bb8d1b33504707fa467d2ffeb695235')

package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  rm "$dstdir/addon-306880-latest.xpi"
  chmod 644 "$dstdir"/META-INF/*
}
