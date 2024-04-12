# Maintainer: Sterophonick
pkgname=rmt-bin
_pkgname='rmt-bin'
pkgver=1.34.00
pkgrel=1
pkgdesc='Raster Music Tracker for making Atari POKEY music.'
url='https://github.com/VinsCool/RASTER-Music-Tracker'
arch=(x86_64 i686)
depends=('wine' 'winetricks')
makedepends=('unzip')
filename=rmt134.00
license=(gpl3)
source=(https://github.com/VinsCool/RASTER-Music-Tracker/releases/download/v1.34.00/rmt134.00.zip
        rmtracker
        rmtracker.desktop
        rmtracker.png
        x-rmt-song.png
        x-rmt-song.xml)
md5sums=('6da9282ae16c133b35aaa6e9c8dc5fb0'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("rmt134.00.zip")

prepare() {
  mkdir -p $filename
  unzip -o -d $filename $filename.zip
}

package() {
  cd $srcdir
  install -Dm755 rmtracker $pkgdir/usr/bin/rmtracker
  install -Dm644 rmtracker.desktop $pkgdir/usr/share/applications/rmtracker.desktop
  install -Dm644 rmtracker.png $pkgdir/usr/share/pixmaps/rmtracker.png
  install -Dm644 x-rmt-song.png $pkgdir/usr/share/pixmaps/x-rmt-song.png
  install -Dm644 x-rmt-song.xml $pkgdir/usr/share/mime/packages/x-rmt-song.xml

  mkdir -p $pkgdir/usr/share/rmtracker

  cp -r $srcdir/$filename/RMT/* $pkgdir/usr/share/rmtracker
  chmod -R 777 $pkgdir/usr/share/rmtracker
}
