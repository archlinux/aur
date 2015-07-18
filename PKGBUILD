# Maintainer: danyf90 <daniele.formichelli@gmail.com>
# Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=2.5.2
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
  sha512sums+=('3cb21992a022ab88aa66af3a26ca478606a1a5120be0a6a401d65cbe93206137cf22faea9d73a4ceee02a47c3a1f433b2baf0149422164956ed3cef1e32e21e5')
else
  _ARCH="x86"
  sha512sums+=('d6be204d31c326c90f1d214f7215bdc3ce4afa96cd2d37e159ea941e050e58b8705f90027680c194f5fe123451ad8e3326904e3cad24e7e1727f7ec4531a9de1')
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
