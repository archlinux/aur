# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=ghostery
pkgname=firefox-extension-$_plugin_name
pkgver=5.4.5
pkgrel=1
pkgdesc="Plugin for Firefox which detects and/or blocks website trackers"
arch=('any')
url="https://www.ghostery.com"
license=('custom')
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/latest/9609/addon-9609-latest.xpi"
        "ghostery.license")
sha1sums=('48401ac6b1075c8cf9be1b80267e517308343693'
          'cf0f4f850554edfd907f07ce3a6451cbc5637e68')


package() {
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/extensions/${emid}
  install -Dm644 ghostery.license "${pkgdir}/usr/share/licenses/ghostery/license"
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/${_plugin_name}-${pkgver}-an+fx.xpi
  chmod -R 755 $dstdir
}
