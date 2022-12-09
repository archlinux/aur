# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=remotebox
pkgver=3.2
pkgrel=1
pkgdesc="Open Source VirtualBox Client with Remote Management"
arch=('any')
url="http://remotebox.knobgoblin.org.uk/"
license=(GPL)
install=remotebox.install
depends=('perl' 'perl-soap-lite' 'perl-gtk3')
optdepends=('rdesktop')
source=("http://remotebox.knobgoblin.org.uk/downloads/RemoteBox-${pkgver}.tar.bz2" "remotebox.desktop")
md5sums=('04a4c2be0802aea1fcae7d14bca0fc71'
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
