# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=firefox-extension-speed-dial
pkgver=0.9.6.15
pkgrel=1
pkgdesc="Firefox extension that simplifies the access to your most visited websites"
arch=('any')
url="http://speeddial.uworks.net/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('firefox')
conflicts=('firefox-speed-dial')
replaces=('firefox-speed-dial')
source=(http://speeddial.uworks.net/speed_dial-$pkgver-fx.xpi)
md5sums=('bbb616afe4ed2c5c40e84e63fab6a6f5')

package() {
  cd "$srcdir"

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d -m755 $dstdir
  cp -dpr --no-preserve=ownership * $dstdir

  rm -f $dstdir/*.xpi
  chmod -R 755 $dstdir
}
