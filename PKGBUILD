# Maintainer: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=2.4.0
pkgrel=1
pkgdesc="Complete set of tools that provides a virtual environment for Android."
arch=('i686' 'x86_64')
license="UNKNOWN"
url="http://www.genymotion.com/"
depends=('virtualbox' 'qtwebkit' 'libpng' 'net-tools' 'qca' 'ffmpeg-compat' 'protobuf')
install=$pkgname.install
sha512sums=('48e9bafe1d64b688c51eceb8d129f44d690060ff9a6d82eefcf3295f7834516ce62439faf4f4454287f594fc410aafbafd30a43537ea3d295c42bee8e4e03ac7')
if [[ $CARCH == x86_64 ]]; then
  _ARCH="x64"
  sha512sums+=('b890b2a687496968d4dea2d0b075303549871886cb200b35fc57238647a0c2103140158887096ef8db36d948152926b30e89ce01e8cb23feecabe06eac4b4564')
else
  _ARCH="x86"
  sha512sums+=('89693fa432737800b71c84f8c08ed2361a5d8d51f120aeace5cb7be62d68f6129ea63ddd22255affd215dc6890b71059fffd8051417c9ec4f88a8f3bf5ac287f')
fi
source=("genymotion.desktop"
        "$pkgname.bin::http://files2.genymotion.com/genymotion/genymotion-$pkgver/genymotion-${pkgver}_$_ARCH.bin")

package(){
  cd $srcdir

  install -d $pkgdir/opt
  chmod +x $pkgname.bin
  yes | ./$pkgname.bin -d $pkgdir/opt
  rm $pkgdir/opt/genymotion/libQt*

  install -d $pkgdir/usr/bin
  ln -s /opt/genymotion/genymotion $pkgdir/usr/bin/genymotion
  ln -s /opt/genymotion/genymotion-shell $pkgdir/usr/bin/genymotion-shell
  ln -s /opt/genymotion/player $pkgdir/usr/bin/player
  install -Dm644 $srcdir/genymotion.desktop $pkgdir/usr/share/applications/genymotion.desktop
  chown -R root:root $pkgdir/opt/genymotion
}
