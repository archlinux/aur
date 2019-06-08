# Maintainer: Mario Ray Mahardhika <leledumbo_cool@yahoo.co.id>
pkgname=staruml
pkgver=3.1.0
pkgrel=1
pkgdesc="A sophisticated software modeler"
arch=('i686' 'x86_64')
url="http://staruml.io/"
license=('custom:staruml')
depends=('gconf' 'libxss' 'libxtst' 'nss' 'alsa-lib' 'gtk2')
source_i686=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-i386.AppImage")
source_x86_64=("$pkgname-$pkgver-$CARCH.AppImage::http://staruml.io/download/releases/StarUML-$pkgver-x86_64.AppImage")
noextract=("$pkgname-$pkgver-$CARCH.AppImage")
sha256sums_i686=('7a470c05d301c35289b7d6eafe422255442208679fdd1d79e1748dd7ea23d78d')
sha256sums_x86_64=('352b5680414ec87c8a11dda6a78ed74f28aa585ad27bcbc46462ab7298569a70')

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
