# Contributor: Laurent Laffont <laurent.laffont@gmail.com>

pkgname=pharo-spur-vm
pkgver=5.0
pkgrel=1
pkgdesc="Pharo Spur VM for Pharo 5 images. Pharo is a clean, innovative, open-source Smalltalk-inspired environment"
conflicts=('pharo' 'pharo-vm-latest')
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo.org/"
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-alsa-lib' 'lib32-libvorbis' 'lib32-pango' 'lib32-mesa' 'lib32-dbus' 'lib32-libxml2' 'wget' 'unzip')
else
  depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'dbus-core' 'libxml2' 'wget' 'unzip')
fi

source=(http://files.pharo.org/sources/PharoV50.sources.zip
        http://files.pharo.org/vm/pharo-spur32/linux/stable-20160623.zip)

md5sums=('9810ede95576dba2fb4f71158ae4a4d6'
				 'f16396ad292ae7b49c0cb236051f589e')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/share/pharo/spur/
  mkdir -p $pkgdir/usr/bin/

  cp -fr $srcdir/* $pkgdir/usr/share/pharo/spur/
  rm $pkgdir/usr/share/pharo/spur/*.zip
  chmod +x $pkgdir/usr/share/pharo/spur/pharo

  chgrp -R users $pkgdir/usr/share/pharo/spur/
  chmod -R 775 $pkgdir/usr/share/pharo/spur/

  ln -s /usr/share/pharo/spur/pharo $pkgdir/usr/bin/pharo-spur
}
