# Maintainer: Sterophonick

pkgname=swivel-bin
_pkgname='swivel-bin'
pkgver=v1.11
pkgrel=1
pkgdesc='SWF to Video converter from Newgrounds'
url='https://www.newgrounds.com/wiki/creator-resources/animation-resources/swivel-flash-to-video'
arch=(x86_64)
depends=('wine')
makedepends=(p7zip)
source=(https://www.newgrounds.com/downloads/swivel/swivel-win64.exe
        swivel
        swivel.desktop
        swivel.png)
md5sums=('0df49fddf3587704918a9cd74db1f0c4' # this program is updated REALLY often :sob:
         'SKIP'
         'SKIP'
         'SKIP')
         
prepare() {
  mkdir -p $srcdir/zip
  7z x swivel-win64.exe -o$srcdir/zip
}

package() {
  cd $srcdir
  install -Dm755 swivel $pkgdir/usr/bin/swivel
  install -Dm644 swivel.desktop $pkgdir/usr/share/applications/swivel.desktop
  install -Dm644 swivel.png $pkgdir/usr/share/pixmaps/swivel.png

  mkdir -p $pkgdir/usr/share/swivel/
  cp -r zip/* $pkgdir/usr/share/swivel
  chmod -R 777 $pkgdir/usr/share/swivel
}
