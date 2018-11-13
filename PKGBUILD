# Maintainer: Konstantin Kogan <kostyalamer@yandex.ru>
# Contributor: Konstantin Kogan <kostyalamer@yandex.ru>
pkgname=gtkhalt
pkgver=0.7
pkgrel=1
pkgdesc="Applet for halt,reboot,logout  and lockscreen"
arch=('x86_64')
url="http://forum.russ2.com/index.php?showforum=124"
license=('GPL')
makedepends=(
  'gtk2'
  'glib2'
  'glibc'
)
depends=(
  'gtk2'
  'i3lock'
)

source=("http://altlinuxclub.ru/arhiv/${pkgname}-${pkgver}.tar.gz")
md5sums=('e69083ec7a8a10456ea2afadc6d61ab7')


build() {

cd "$srcdir/$pkgname-$pkgver"
./configure
make VERSION=$pkgver DESTDIR="$pkgdir" PREFIX2=/usr
make
cat > $pkgname.desktop <<@@@
[Desktop Entry]
Type=Application
Name=GtkHalt
GenericName= Applet
GenericName[ru]= Апплет
Comment=Applet for halt, reboot and screenlock
Exec=gtkhalt
Categories=System;
StartupNotify=false
Terminal=false
@@@

cat > $pkgname <<@@@
#!/bin/bash
# -*- coding: utf-8 -*-
cd /usr/lib/gtkhalt/
/usr/lib/gtkhalt/gtkhalt
@@@

}

package() {

cd "$srcdir/$pkgname-$pkgver"
mkdir -p $pkgdir/usr/lib/$pkgname/Data
cp -R src/Data $pkgdir/usr/lib/$pkgname/
install -pDm755 src/$pkgname $pkgdir/usr/lib/$pkgname/$pkgname
install -pDm755 src/Data/logout.sh $pkgdir/usr/bin/logout_de
install -pDm755 $pkgname $pkgdir/usr/bin/$pkgname
install -D $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

}

