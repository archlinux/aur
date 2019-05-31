# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=maptiler-oss
pkgver=1.0.beta2
pkgrel=2
pkgdesc="Map Tile Cutter - Tile Overlay Generator for Google Maps and Google Earth"
arch=('any')
url="http://www.maptiler.org/"
license=('BSD')
depends=('gdal' 'python2-gdal')
replaces=('maptiler32bit')
makedepends=('dpkg')
source=(https://github.com/jose1711/maptiler/archive/master.zip)
md5sums=('d08159ae6c8c6ebf760d3ef749fc7824')

package() {
  cd $srcdir/maptiler-master
  install -d ${pkgdir}/usr/share/maptiler/maptiler/pp ${pkgdir}/usr/bin

  tar -cf - --exclude deploy . | tar -C "$pkgdir/usr/share/maptiler" -xvf -
  sed -i 's/Icon=.*/Icon=maptiler/' deploy/linux/maptiler.desktop
  install -Dm644 deploy/linux/maptiler.desktop $pkgdir/usr/share/applications/maptiler.desktop
  install -Dm644 resources/icon.png $pkgdir/usr/share/pixmaps/maptiler.png
  ln -s /usr/share/maptiler/maptiler.py $pkgdir/usr/bin/maptiler
}

# vim:set ts=2 sw=2 et:
