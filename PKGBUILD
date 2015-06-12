# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=remotebox
pkgver=1.9
pkgrel=1
pkgdesc="Open Source VirtualBox Client with Remote Management"
arch=('any')
url="http://remotebox.knobgoblin.org.uk/"
license=("gpl")
install="remotebox.install"
depends=('perl' 'perl-soap-lite' 'gtk2-perl')
optdepends=('rdesktop')
source=("http://remotebox.knobgoblin.org.uk/downloads/RemoteBox-${pkgver}.tar.bz2" "remotebox.desktop")
md5sums=('ddd84bddedfd45f5384bd4c874750e24'
         'b64b16d198471f9868ce7ed018295296')

package() {
  mkdir -p $pkgdir/usr/{share/{applications,doc/remotebox,remotebox},bin}
  cd $srcdir/
  cd RemoteBox-${pkgver}/share/remotebox
  /bin/tar cf - * | ( cd ../../../../pkg/remotebox/usr/share/remotebox/; tar xfp - )
  sed -i '/Bin\/share\/remotebox/s/\$Bin/\/usr/' ../../remotebox 
  sed -i '/use FindBin/a\
$Bin='\''/usr/'\'';' ../../remotebox
  install -Dm755 ../../remotebox $pkgdir/usr/bin/remotebox
  install -Dm644 icons/remotebox-about.png $pkgdir/usr/share/pixmaps/remotebox.png
  install -Dm644 $srcdir/remotebox.desktop $pkgdir/usr/share/applications/remotebox.desktop
  install -Dm644 ../../docs/* $pkgdir/usr/share/doc/remotebox
}
