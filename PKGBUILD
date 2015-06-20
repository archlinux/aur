# Maintainer: Peter Ivanov <ivanovp@gmail.com>
# Contributor: joat <joat at lavabit dot com>
# Submitter: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabxc32-bin
pkgver=1.33
pkgrel=3
pkgdesc="C/C++ compiler for PIC32 MCUs"
arch=(i686 x86_64)
url=http://www.microchip.com/xc32
license=(custom)
depends=(xclm-dirs)
[ $CARCH = x86_64 ] && depends+=(lib32-gcc-libs lib32-expat)
[ $CARCH = x86_64 ] && makedepends=(lib32-fakeroot)
provides=(mplabxc32)
conflicts=(mplabxc32)
options=(!strip docs libtool emptydirs !zipman staticlibs !upx)
PKGEXT='.pkg.tar'
install=$pkgname.install
instdir=/opt/microchip/xc32/v$pkgver
installer=xc32-v$pkgver-full-install-linux-installer.run
source=(http://ww1.microchip.com/downloads/en/DeviceDoc/$installer)
md5sums=('9f4f086d6f2b9c044f9cd2e46ec3f56c')

package() {
  echo -e "Creating the Package\n  Please wait..."

  chmod 755 $srcdir/$installer
  echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\ny\n1\nn\n$pkgdir$instdir\nn\ny\ni\n" > $srcdir/inst_input

  HOME=$srcdir $srcdir/$installer --mode text < $srcdir/inst_input &> /dev/null || true

  chmod -R 755 $pkgdir$instdir/{bin,etc}
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/MPLAB_XC32_Compiler_License.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
