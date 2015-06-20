# Maintainer: Pierre Dorbais <pierre at dorbais dot fr>

pkgname=firefox-extension-add-to-search-bar
pkgver=2.8
_addons_file=3682
pkgrel=2
pkgdesc="Add any search engine to the search bar."
arch=('any')
url="https://firefox.maltekraus.de/extensions/add-to-search-bar"
license=('MPL' 'GPL' 'LGPL')
depends=('firefox')
source=("https://addons.cdn.mozilla.net/user-media/addons/${_addons_file}/add_to_search_bar-${pkgver}-fx.xpi")
md5sums=('e95fae25a54ef043bda414d7c2e60675')

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
