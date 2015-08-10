# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=1.0.0
pkgrel=2
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://www.eff.org/files/privacy-badger-latest.xpi")
sha256sums=('3495dc439a96c9f2067654527de5e111f1da3427d48334024246413fbf49d5d6')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/privacy_badger-latest.xpi
  chmod -R 755 $dstdir
}
