# Maintainer: Evan Anderson <evananderson@thelinuxman.us>
# Former maintainer: David Manouchehri <david@davidmanouchehri.com>
# Former maintainer: BxS <bxsbxs at gmail dot com>

pkgname=microchip-mplabc18-bin
pkgver=3.40
pkgrel=1
pkgdesc="C compiler for PIC18 MCUs"
arch=(i686 x86_64)
url=http://www.microchip.com/c18
license=(custom)
[[ $CARCH = x86_64 ]] && depends=(lib32-gcc-libs)
provides=(mplabc18)
conflicts=(mplabc18)
options=(!strip docs libtool emptydirs !zipman)
install=$pkgname.install
instdir=/opt/microchip/mplabc18/v$pkgver
installer=mplabc18-v$pkgver-linux-full-installer.run
source=(https://bitbucket.org/simbuckone/simbuckbaseproject/downloads/$installer)
md5sums=(f29df9a4e5c9641a8909bd0a5452d4a9)

package() {
  echo -e "Creating the Package\n  Please wait..."

  cd $pkgdir

  mkdir -p $pkgdir$instdir

  chmod 0755 $srcdir/$installer
  echo -e "\n\n\n\n\n\n\n\n\n\ny\n$pkgdir$instdir\ny" > inst_input
  $srcdir/$installer --mode text < inst_input &> /dev/null
  rm inst_input

  rm $pkgdir$instdir/Uninstall*

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  ln -s $instdir/MPLABC18CompilerLicense.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
