# Contributor : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'

pkgname=ares
pkgver=2.4.0.3064
pkgrel=1
pkgdesc="A free open source file sharing program that enables users to share any digital file including images, audio, video, software, documents, etc. (via wine)"
arch=(i686 x86_64)
url="http://aresgalaxy.sourceforge.net/"
license=('GPL')
depends=()
[ "$CARCH" = i686   ] && depends=(wine)
[ "$CARCH" = x86_64 ] && depends=(bin32-wine)
makedepends=(p7zip)
source=(ares.sh ares.desktop ares.xpm http://pilotfiber.dl.sourceforge.net/project/aresgalaxy/aresgalaxy/AresRegular240_021816/aresregular240_installer.exe)
md5sums=('c9e141a0d07b076825cb059d0a1d7dc7'
         '22084eb3acd121ef811180f7f238047c'
         'f89b51f21633e02c9017222b33544c1b'
         '196ab03aef55c82fbbd0190fb69ba497')

noextract=()
options=(!strip)

build() {
  cd $srcdir/
  7z x -o$pkgname aresregular240_installer.exe
}
package() {
  cd $srcdir/

  install -d -m755 $pkgdir/usr/share/
  cp -R $pkgname $pkgdir/usr/share/$pkgname
  find $pkgdir/usr/share/$pkgname -type d -exec chmod 755 "{}" \;
  find $pkgdir/usr/share/$pkgname -type f -exec chmod 644 "{}" \;
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/share/applications
  install -d -m755 $pkgdir/usr/share/pixmaps

  install -m755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -m644 $pkgname.desktop $pkgdir/usr/share/applications
  install -m644 $pkgname.xpm $pkgdir/usr/share/pixmaps
}

