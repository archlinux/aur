# Maintainer: Pierre Dorbais <pierre at dorbais dot fr>

pkgname=firefox-extension-smoothwheel
pkgver=0.45.8.20130519.3
_addons_file=357
pkgrel=1
pkgdesc="Scrolls the page smoothly when scrolling the mouse wheel"
arch=('any')
url="http://smoothwheel.mozdev.org/"
license=('GPLv2')
source=("https://addons.cdn.mozilla.net/storage/public-staging/${_addons_file}/smoothwheel-${pkgver}-sm+fx+tb.xpi")
md5sums=('2b83ad98f8add58d9ba125bf13adf539')

package() {
  cd $srcdir
  local emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  install -d $dstdir
  cp -R * $dstdir
  rm $dstdir/*.xpi
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;
}
