# Maintainer: Facundo Tuesca <facutuesca at gmail dot com>
pkgname=briss
pkgver=0.9
pkgrel=6
pkgdesc="Java tool to crop pages of PDF documents to one or more regions selected with a GUI."
arch=('any')
url="http://sourceforge.net/projects/briss/"
license=('GPL')
depends=('java-runtime')
makedepends=('imagemagick')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('030380e0ca3ff05f2dff9590a2fa4ab7')
package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/$pkgname
  bsdtar -xf $pkgname-$pkgver.jar Briss_icon_032x032.gif
  convert Briss_icon_032x032.gif $pkgname-icon.png
  cp * $pkgdir/usr/share/$pkgname/
  mkdir -p $pkgdir/usr/bin
  cat >> $pkgdir/usr/bin/$pkgname << EOF 
#!/bin/sh
exec java -jar /usr/share/$pkgname/$pkgname-$pkgver.jar "\$@"
EOF
  chmod a+x $pkgdir/usr/bin/$pkgname
  mkdir -p $pkgdir/usr/share/applications
  cat >> $pkgdir/usr/share/applications/$pkgname.desktop << EOF
[Desktop Entry]
Type=Application
Version=1.0
Name=Briss
Comment=PDF cropping tool
Exec=$pkgname
Icon=/usr/share/briss/$pkgname-icon.png
Terminal=false
Categories=Graphics;Viewer;2DGraphics;RasterGraphics;
EOF
   chmod a+r $pkgdir/usr/share/applications/$pkgname.desktop
}
