# Maintainer: Sterophonick
pkgname=tile-molester
pkgbase=tile-molestor
_pkgname='tile-molester'
pkgver=0.19
pkgrel=4
pkgdesc='Multi-format graphics editor for ROM hacking'
url='https://www.romhacking.net/utilities/991/'
arch=(any)
depends=('jre17-openjdk') # specifically needs a java that's not 22 so i tried this one. bruh.
makedepends=('p7zip')
source=(https://romhacking.it/upload/tools/[115]TM019.7z
        tile-molester
        tile-molester.desktop
        tile-molester.png)
md5sums=('759ced6b3d483ec256cd5fd2f74d4ac5'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("[115]TM019.7z")
conflicts=(tile-molestor)

prepare() {
  mkdir -p molester
  7z x [115]TM019.7z -aou -omolester
}

package() {
  cd $srcdir
  install -Dm755 tile-molester $pkgdir/usr/bin/tile-molester
  install -Dm644 tile-molester.desktop $pkgdir/usr/share/applications/tile-molester.desktop
  install -Dm644 tile-molester.png $pkgdir/usr/share/pixmaps/tile-molester.png

  mkdir -p $pkgdir/usr/share/tile-molester

  cp -r $srcdir/$filename/molester/TileMolester\ 0.19/* $pkgdir/usr/share/tile-molester
  chmod -R 777 $pkgdir/usr/share/tile-molester
}
