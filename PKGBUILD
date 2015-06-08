# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Patrik Ilg <p.ilg@arcor.de>

pkgname=tileracer
pkgver=0.702
pkgdesc="3D stunt racing game which features realistic car physics and an in game track editor"
pkgrel=3
arch=('i686' 'x86_64')
url="http://tileracer.model-view.com"
license=('None')
depends_x86_64=('lib32-libgl' 'lib32-mesa' 'lib32-libxmu')
depends_i686=('libgl' 'mesa' 'libxmu')
conflicts=('physx' 'lib32-physx')
source=(http://tileracer.model-view.com/mirrordownload.php?file=TileRacer${pkgver}.tar.gz TileRacer.desktop)
md5sums=('c9d1d9fcc835aaf07933b7608f03d542'
         'b81904a3a0a59df5ce5631a8f2f89fae')
noextract=(mirrordownload.php?file=TileRacer${pkgver}.tar.gz)

package()
{
  cd "$srcdir/"

  install -d "$pkgdir/usr/share/applications"
  install -m655 "$srcdir/TileRacer.desktop" "$pkgdir/usr/share/applications/"
  install -d "$pkgdir/usr/share/${pkgname}"

  tar xzvf mirrordownload.php?file=TileRacer${pkgver}.tar.gz -C "$pkgdir/usr/share/${pkgname}"
  chown -Rh root:root $pkgdir/usr/share/${pkgname}

  install -d $pkgdir/usr/bin
  echo \#\!/bin/sh > $pkgdir/usr/bin/tileracer
  echo /usr/share/tileracer/TileRacer.sh >> $pkgdir/usr/bin/tileracer
  chmod +x $pkgdir/usr/bin/tileracer
}
