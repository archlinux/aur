# Maintainer: Szymon Scholz
# Package orphaned by developers. Source and upstream links only available via archive.org
pkgname=vpnc-gui
pkgver=0.11
pkgrel=3
pkgdesc="gtk graphical user interface for vpnc"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20150802135701/http://ticc.mines.edu/csm/wiki/index.php/Vpnc-gui"
license=('GPL')
depends=('vpnc' 'gtk2')
makedepends=('libglade' 'glib2')
source=(Vpnc-gui.tgz::http://web.archive.org/web/20150802135700/ticc.mines.edu/csm/wiki/images/5/58/Vpnc-gui.tgz
        vpnc-gui.desktop
        vpnc-gui.svg
        logo.png
        logo16.png)
md5sums=('c347204294e6f0ae68a298e6ae2c83cf'
         '662617050ac44d95f4bd4bc65b5ec915'
         '1bc33db1772016fd7e8be8c4983027e7'
         '788d1a75c2b1e6582cd198d8f89b50e7'
         '41512423e9876436a4851c33df9de7d7')

build() {
  cd $pkgname
  ./configure --prefix=/usr
  rm csm.conf
  rm default.conf
  touch default.conf
  make
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/bin
  install -Dm 644 vpnc-gui.glade $pkgdir/usr/share/vpnc-gui/vpnc-gui.glade
  install -Dm 755 vpnc-gui $pkgdir/usr/share/vpnc-gui/vpnc-gui
  ln -s /usr/share/vpnc-gui/vpnc-gui $pkgdir/usr/bin/vpnc-gui
  install -Dm 644 $srcdir/logo.png $pkgdir/usr/share/vpnc-gui/logo.png
  install -Dm 644 $srcdir/logo16.png $pkgdir/usr/share/vpnc-gui/logo16.png
  install -Dm 644 $srcdir/vpnc-gui.desktop $pkgdir/usr/share/applications/vpnc-gui.desktop
  install -Dm 644 $srcdir/vpnc-gui.svg $pkgdir/usr/share/vpnc-gui/icons/vpnc-gui.svg
}
