# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Maintainer: Arthur Zamarin <arthurzam@gmail.com>

_plugin_name=ghostery
pkgname=firefox-extension-$_plugin_name
pkgver=5.4.8.1
pkgrel=2
pkgdesc="Plugin for Firefox which detects and/or blocks website trackers"
arch=('any')
url="https://www.ghostery.com"
license=('custom')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/9609/addon-9609-latest.xpi"
        "ghostery.license")
sha1sums=('3bb2cbcb5b43bf508f0f645892315cbc964ce5fd'
          'cf0f4f850554edfd907f07ce3a6451cbc5637e68')


package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir="$pkgdir/usr/lib/firefox/browser/extensions/${emid}"
  install -Dm644 ghostery.license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  rm "$dstdir"/{addon-9609-latest.xpi,ghostery.license}

  find "$dstdir" -type f -exec chmod +r {} \;
}
