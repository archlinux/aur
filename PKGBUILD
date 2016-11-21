# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: ugaciaka <ugaciaka@gmail.com>
# Thank's Imanol Celaya <ilcra1989@gmail.com> for arch x86
# Florian Bäuerle <florian.bae@gmail.com>

pkgname=bin32-4l
pkgver=1.0r6
_realname=4L-1.0-r6
pkgrel=10
pkgdesc="4L: LaCie LightScribe Labeler for Linux"
arch=('x86_64')
url="http://www.lacie.com/products/product.htm?pid=10803"
license=('unknown')
install=4l.install
depends=('lib32-fontconfig' 'lib32-gcc-libs' 'lib32-libxcursor' 'lib32-libxi' 'lib32-libxinerama' 'lib32-libxrandr' 'bin32-lightscribe')
conflicts=('4l_x86_64')
source=($_realname.i586.rpm::http://www.lacie.com/files/lacie-content/download/drivers/LaCie%20LightScribe%20Labeler%201.0%20Linux.rpm lightscribe.png lightscribe.desktop 4L-cli)
md5sums=('11fc8b2daeaed2b61a567056413bdefd'
         '582b6cce827c8909115a31c7bc10d6ce'
         'c6e2b9fb763819213e48c7861ae23431'
         '0fa508184d8e96ba5ba28999e075ed34')

package() {
  cd $srcdir
  mkdir -p $pkgdir/{opt/4L/lib,usr/bin}
  cp -R usr/4L $pkgdir/opt
  mv $pkgdir/opt/4L/4L-cli $pkgdir/opt/4L/4L-cli.bin
  install -m755 $srcdir/4L-cli $pkgdir/opt/4L
  cd $pkgdir/usr/bin
  ln -s ../../opt/4L/4L-cli 4L-cli
  ln -s ../../opt/4L/4L-gui 4L-gui
  find $pkgdir/opt -type d -exec chmod 755 {} \;
  chmod -x $pkgdir/opt/4L/*/*
  install -D -m644 $srcdir/lightscribe.png ${pkgdir}/usr/share/pixmaps/lightscribe.png
  install -D -m644 $srcdir/lightscribe.desktop ${pkgdir}/usr/share/applications/lightscribe.desktop
}
