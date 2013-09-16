# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux (a) free.fr>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=firefox-extension-speed-dial
pkgver=0.9.6.17
pkgrel=1
pkgdesc="Firefox extension that simplifies the access to your most visited websites"
arch=('any')
url="http://speeddial.uworks.net/"
license=('GPL2' 'LGPL2.1' 'MPL')
depends=('firefox')
conflicts=('firefox-speed-dial')
replaces=('firefox-speed-dial')
source=(http://speeddial.uworks.net/speed_dial-$pkgver-fx.xpi)
md5sums=('7d71ec9405f41d59a8234fa17f4f4a50')

package() {
  cd "$srcdir"

  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)

  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d -m755 $dstdir
  cp -dpr --no-preserve=ownership * $dstdir

  rm -f $dstdir/*.xpi
  chmod -R 755 $dstdir
}
