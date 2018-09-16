# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=3.0.2
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('i686' 'x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('gconf' 'libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source_i686=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-i386.AppImage")
source_x86_64=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-x86_64.AppImage")
noextract=("$pkgname-$pkgver-$CARCH.AppImage")
sha256sums_i686=('e971676cc6eb9a5f0e6a0d3969ea3d5cf87ea6e09f44d24d6aef3bd3d82e9960')
sha256sums_x86_64=('c87bbbada0223f8d05d23f48b8b513e1464daa902d1b736beb926ffe97d867e8')

prepare() {
  chmod +x $pkgname-$pkgver-$CARCH.AppImage
  ./$pkgname-$pkgver-$CARCH.AppImage --appimage-extract
}

package() {
  mkdir -p $pkgdir/opt/${pkgname} $pkgdir/usr/share/applications $pkgdir/usr/bin/
  cp -Rf $srcdir/squashfs-root/app/* $pkgdir/opt/${pkgname}
  cp -Rf $srcdir/squashfs-root/usr/share/* $pkgdir/usr/share
  cp -fp  $srcdir/squashfs-root/staruml.desktop $pkgdir/usr/share/applications
  sed -i 's/AppRun/staruml/g' $pkgdir/usr/share/applications/staruml.desktop
  chmod -R 755 $pkgdir
  ln -fs /opt/staruml/staruml $pkgdir/usr/bin/staruml
  ln -fs /usr/share/icons/hicolor/512x512/apps/staruml.png $pkgdir/opt/${pkgname}/staruml.png
}
