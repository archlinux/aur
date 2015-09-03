# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=shumway
_plugin_version=20130816

pkgname=firefox-extension-$_plugin_name
pkgdesc="HTML5 implementation of flash for Firefox"
pkgver=0.11.517
pkgrel=1
arch=('any')
url="https://mozilla.github.io/shumway/"
makedepends=( 'unzip' )
depends=("firefox>=18")
license=('MIT')
source=( "$pkgname-$pkgver.xpi::https://mozilla.github.io/shumway/extension/firefox/shumway.xpi" )
sha1sums=('SKIP') # skip check because this changes rapidly

package(){
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -r * $dstdir
  rm -f $dstdir/$pkgname-$pkgver.xpi
  chmod -R 755 $dstdir
}

pkgver(){
  unzip -p $srcdir/$pkgname-$pkgver.xpi content/version.txt | head -1
}

