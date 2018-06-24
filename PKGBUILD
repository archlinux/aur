# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=3.0.0
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('i686' 'x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('gconf' 'libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source_i686=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-i386.AppImage")
source_x86_64=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-x86_64.AppImage")
noextract=("$pkgname-$pkgver-$CARCH.AppImage")
sha256sums_i686=('be5c4d01386e6c853a37e3b13129f32424a8f5975f65c55f505674329fa5675b')
sha256sums_x86_64=('ddfe85e674bd292aeb43f9575a07ca703d7f4ffdb071f6452a537e30fb65faec')

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
