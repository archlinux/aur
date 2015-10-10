# Maintainer: Pablo Lezaeta <prflr arro'a gmail puntocom>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=shumway
_plugin_version=20130816

pkgname=palemoon-extension-$_plugin_name
pkgdesc="Mozilla HTML5 implementation of flash for Palemoon"
pkgver=0.11.607
pkgrel=1
arch=('any')
url="https://mozilla.github.io/shumway/"
makedepends=( 'unzip' )
depends=("palemoon>=18")
license=('MIT')
source=( "$pkgname-$pkgver.xpi::https://mozilla.github.io/shumway/extension/firefox/shumway.xpi" )
sha1sums=('SKIP') # skip check because this changes rapidly

package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/palemoon/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm -f $dstdir/$pkgname-$pkgver.xpi
  chmod -R 755 $dstdir
}

pkgver(){
  unzip -p $srcdir/$pkgname-$pkgver.xpi content/version.txt | head -1
}
