# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
pkgname=firefox-extension-privacybadger
pkgver=0.2.6.2
pkgrel=1
pkgdesc="Privacy Badger blocks spying ads and invisible trackers."
license=('GPL3')
arch=('any')
url="https://www.eff.org/privacybadger"
depends=("firefox")
source=("https://addons.mozilla.org/firefox/downloads/file/313230/privacy_badger-${pkgver}-fx.xpi")
sha256sums=('315ff1f7e685f14be446d199233c7cf70faa5eb4d78a7bed2cbdec5284254236')

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  cp -dpr --no-preserve=ownership * $dstdir
  rm $dstdir/privacy_badger-${pkgver}-fx.xpi
  chmod -R 755 $dstdir
}
