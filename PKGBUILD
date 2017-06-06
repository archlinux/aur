# Maintainer: Laurent Laffont <laurent.laffont@gmail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>
# Contributor: Benoit Verhaeghe <badetitou@gmail.com>


pkgname=pharo-vm
pkgver=5.0
pkgrel=2
pkgdesc="Pharo-VM for Pharo 4 images. Pharo is a clean, innovative, open-source Smalltalk-inspired environment"
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

source=(http://files.pharo.org/sources/PharoV40.sources.zip
        http://files.pharo.org/vm/pharo/linux/548.zip)

md5sums=('f748553d42c7dda963d56286e3be3f08'
         '2a6187fdef9eaa507661910092f554ac')

package() {
  cd $srcdir/
  mkdir -p $pkgdir/usr/lib/pharo/shared/vm/40/
  mkdir -p $pkgdir/usr/bin/

  cp -fr $srcdir/* $pkgdir/usr/lib/pharo/shared/vm/40/
  rm $pkgdir/usr/lib/pharo/shared/vm/40/*.zip
  chmod +x $pkgdir/usr/lib/pharo/shared/vm/40/pharo

  chgrp -R users $pkgdir/usr/lib/pharo/shared/vm/40/
  chmod -R 775 $pkgdir//usr/lib/pharo/shared/vm/40/

  ln -s /usr/lib/pharo/shared/vm/40/pharo $pkgdir/usr/bin/pharo
}
