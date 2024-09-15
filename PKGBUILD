# Maintainer: Sterophonick
pkgname=tile-molestor
_pkgname='tile-molestor'
pkgver=0.19
pkgrel=1
pkgdesc='Multi-format graphics editor for ROM hacking'
url='https://www.romhacking.net/utilities/991/'
arch=(any)
depends=('jre17-openjdk') # specifically needs a java that's not 22 so i tried this one. bruh.
makedepends=('p7zip')
source=(https://archive.org/download/romhacking.net-20240801/rhdn_20240801.zip/utilities%2F[991]TM019.7z
        tile-molestor
        tile-molestor.desktop
        tile-molestor.png)
md5sums=('759ced6b3d483ec256cd5fd2f74d4ac5'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("%5B991%5DTM019.7z")

prepare() {
  mkdir -p molestor
  7z x %5B991%5DTM019.7z -aou -omolestor
}

package() {
  cd $srcdir
  install -Dm755 tile-molestor $pkgdir/usr/bin/tile-molestor
  install -Dm644 tile-molestor.desktop $pkgdir/usr/share/applications/tile-molestor.desktop
  install -Dm644 tile-molestor.png $pkgdir/usr/share/pixmaps/tile-molestor.png

  mkdir -p $pkgdir/usr/share/tile-molestor

  cp -r $srcdir/$filename/molestor/TileMolester\ 0.19/* $pkgdir/usr/share/tile-molestor
  chmod -R 777 $pkgdir/usr/share/tile-molestor
}
