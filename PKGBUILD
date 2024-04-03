# Maintainer: Sterophonick
pkgname=geepee32
_pkgname='geepee32'
pkgver=0.44
pkgrel=1
pkgdesc='Windows application to emulate the GamePark GP32 system.'
url='https://www.schuerewegen.tk/gp32/'
arch=(x86_64 i686)
depends=('wine')
makedepends=('unzip')
filename=geepee32_044_win32_directx
source=(https://www.schuerewegen.tk/download/geepee32_044_win32_directx.zip
        geepee32
        geepee32.desktop
        geepee32.png)
md5sums=('a095dfdc88596e7f356d7a71d8030491'
         'SKIP'
         'SKIP'
         'SKIP')
noextract=("geepee32_044_win32_directx.zip")

prepare() {
  mkdir -p $filename
  unzip -o -d $filename $filename.zip
}

package() {
  cd $srcdir
  install -Dm755 geepee32 $pkgdir/usr/bin/geepee32
  install -Dm644 geepee32.desktop $pkgdir/usr/share/applications/geepee32.desktop
  install -Dm644 geepee32.png $pkgdir/usr/share/pixmaps/geepee32.png

  mkdir -p $pkgdir/usr/share/geepee32

  cp -r $srcdir/$filename/* $pkgdir/usr/share/geepee32

  rm -rf $pkgdir/usr/share/geepee32/system/gp32/config
  rm -rf $pkgdir/usr/share/geepee32/system/gp32/firmware
  rm -rf $pkgdir/usr/share/geepee32/system/gp32/log
  rm -rf $pkgdir/usr/share/geepee32/system/gp32/screenshot

  chmod -R 777 $pkgdir/usr/share/geepee32
}
