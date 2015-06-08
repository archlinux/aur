# Maintainer: Daniel Nagy <danielnagy at gmx de>

_plugin_name=feedly-notifier
_plugin_version=2.8.3
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=1
pkgdesc="Firefox extension for reading news from rss aggregator Feedly."
license=('MPL 2.0')
arch=('any')
url="https://addons.mozilla.org/firefox/addon/feedly-notifier/"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/225657/feedly_notifier-${_plugin_version}-fx.xpi")
sha1sums=('7808af38b6c37fc59d3025f5fb906c1723e765fd')

package() {
  cd "$srcdir"
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}
