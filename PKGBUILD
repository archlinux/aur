# Maintainer: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=2.5.0
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
  sha512sums+=('d4c4f6b7f4d5c6d8ea6efc68a80db29cb7f443ff0a57f2e904947874a5a8801bb718c96a3f433ce54fe768376c1dbaaf699d43efeb8d8ef3c7b3b440997cacd8')
else
  _ARCH="x86"
  sha512sums+=('747e7d25bc419e4129bcebb120b718d45a2a5f2a650e63c6ac578b2da2f2535fd37f5e5b1d7782f19de0e7268d552edaeb3d1f323ea4358e81dcacd015e63769')
fi
source=("genymotion.desktop"
        "http://files2.genymotion.com/genymotion/genymotion-$pkgver/$pkgname-${pkgver}_$_ARCH.bin")

package(){
  cd $srcdir

  install -d $pkgdir/opt
  chmod +x $pkgname-${pkgver}_$_ARCH.bin
  yes | ./$pkgname-${pkgver}_$_ARCH.bin -d $pkgdir/opt
  rm $pkgdir/opt/genymotion/libQt*

  install -d $pkgdir/usr/bin
  ln -s /opt/genymotion/genymotion $pkgdir/usr/bin/genymotion
  ln -s /opt/genymotion/genymotion-shell $pkgdir/usr/bin/genymotion-shell
  ln -s /opt/genymotion/player $pkgdir/usr/bin/player
  install -Dm644 $srcdir/genymotion.desktop $pkgdir/usr/share/applications/genymotion.desktop
  chown -R root:root $pkgdir/opt/genymotion
}
