# Maintainer : Pim Bliek <pim@pimbliek.nl>
# Contributor : Elvin L <elvin@eelviny.me>

pkgname=rocrail
pkgver=1621
pkgrel=2.1
pkgdesc="Rocrail - Innovative Model Railroad Control System"
arch=('x86_64')
url="http://wiki.rocrail.net/"
license=('Proprietary')
depends=('wxgtk2' 'libusb' 'wxgtk-common')
makedepends=()
source=("https://launchpad.net/rocrail/trunk/2.1/+download/Rocrail-$pkgver-archlinux-$arch.zip")
md5sums=('dc8ebea1d8ee3a8b9d9e92a7db55760a')

package() {
  msg "Installing..."
  cd "$srcdir/"
  chmod -R 755 .
  mkdir -p $pkgdir/opt/rocrail
  cp -r * $pkgdir/opt/rocrail/.
  rm $pkgdir/opt/rocrail/*.zip
  chmod -R 755 $pkgdir/opt/rocrail

  TEMPFILE="rocrail.desktop"
  echo "[Desktop Entry]" > $TEMPFILE
  echo "Type=Application" >> $TEMPFILE
  echo "Version=$pkgver" >> $TEMPFILE
  echo "Name=Rocrail" >> $TEMPFILE
  echo "Comment=$pkgdesc" >> $TEMPFILE
  echo "Path=/opt/rocrail/" >> $TEMPFILE
  echo "Exec=/opt/rocrail/rocview.sh" >> $TEMPFILE
  echo "Icon=/opt/rocrail/rocrail.png" >> $TEMPFILE
  echo "Terminal=false" >> $TEMPFILE
  echo "Categories=Application;" >> $TEMPFILE

  chmod +x $TEMPFILE
  mkdir -p $pkgdir/usr/share/applications
  cp -p $TEMPFILE $pkgdir/usr/share/applications/.
  mkdir -p $pkgdir/usr/share/pixmaps
  cp -p rocrail.png $pkgdir/usr/share/pixmaps/.
}
