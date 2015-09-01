# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=ghostery
pkgname=firefox-extension-$_plugin_name
pkgver=5.4.7
pkgrel=1
pkgdesc="Plugin for Firefox which detects and/or blocks website trackers"
arch=('any')
url="https://www.ghostery.com"
license=('custom')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/9609/addon-9609-latest.xpi"
        "ghostery.license")
sha1sums=('1061524b7ebccbb4e70df4d607d039a9765e2814'
          'cf0f4f850554edfd907f07ce3a6451cbc5637e68')


package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -Dm644 ghostery.license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  rm "$dstdir"/addon-9609-latest.xpi
}
