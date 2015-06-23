# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=papilio-zap-ide
pkgver=2.3.0
pkgrel=1
pkgdesc="ZPUino Arduino Papilio IDE is specially designed to get you up and running quickly with Soft Processors on the Papilio FPGA boards"
arch=('x86_64' 'i686')
url="http://forum.gadgetfactory.net/index.php?/files/file/8-zap-zpuino-arduino-papilio-ide/"
license=('GPL')
groups=()
options=(!strip)
depends=('java-runtime')
source=('zap-2.3.0-linux32.tgz::http://www.gadgetfactory.net/download/zap/zap-2.3.0-linux32.tgz' 'zap' 'zap.desktop' 'zap.png')
install=papilio-zap-ide.install
md5sums=('0a368962003d8353bd1c2bffd7a553c3'
         '68db64c3499e036948fdad012b93610b'
         'b508e3dcaaaee7fea7db42433e7d9ef2'
         '9e36d33891d5e68d38ec55d1494499a5')

build() {
  echo "Nothing to build..."
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p $pkgdir/usr/share/papilio-zap-ide
  cp -ax * $pkgdir/usr/share/papilio-zap-ide
  if test "$CARCH" == x86_64; then
      echo "64-bit serial library is used..."
      cp -ax ./lib/librxtxSerial64.so $pkgdir/usr/share/papilio-zap-ide/lib/librxtxSerial.so
  fi
  cd "$srcdir"
  install -D -m755 zap "${pkgdir}/usr/bin/zap"
  install -D -m644 zap.desktop "${pkgdir}/usr/share/applications/zap.desktop"
  install -D -m644 zap.png "${pkgdir}/usr/share/pixmaps/zap.png"
}
