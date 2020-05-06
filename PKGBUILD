# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=3.2.2
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('i686' 'x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('gconf' 'libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source_i686=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-i386.AppImage")
source_x86_64=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver.AppImage")
noextract=("$pkgname-$pkgver-$CARCH.AppImage")
sha256sums_i686=('bce1c4af3d01d083525ee220635ba227b2698f995c31fc3dfc89b07065a9f46a')
sha256sums_x86_64=('4fa36d795989e8860743694e6ef11ebd6250e06f938843a794b45a1d9e4de774')


prepare() {
  chmod +x $pkgname-$pkgver-$CARCH.AppImage
  ./$pkgname-$pkgver-$CARCH.AppImage --appimage-extract
}

package() {
  mkdir -p $pkgdir/opt/${pkgname} $pkgdir/usr/share/applications $pkgdir/usr/bin/
  find $srcdir/squashfs-root/* -path $srcdir/squashfs-root/usr -prune -o -prune -exec cp -Rf {} $pkgdir/opt/${pkgname} \;
  cp -Rf $srcdir/squashfs-root/usr/share/* $pkgdir/usr/share
  cp -fp  $srcdir/squashfs-root/staruml.desktop $pkgdir/usr/share/applications
  sed -i 's/AppRun/staruml/g' $pkgdir/usr/share/applications/staruml.desktop
  chmod -R 755 $pkgdir
  ln -fs /opt/staruml/staruml $pkgdir/usr/bin/staruml
  ln -fs /usr/share/icons/hicolor/512x512/apps/staruml.png $pkgdir/opt/${pkgname}/staruml.png
}
