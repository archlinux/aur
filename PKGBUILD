# Maintainer: Laurent Laffont <laurent.laffont@gmail.com>
# Maintainer: Benoit Verhaeghe <badetitou@gmail.com>

pkgname=pharo-spur-vm
pkgver=6.0
pkgrel=0
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

source=('http://files.pharo.org/sources/PharoV50.sources.zip'
        'http://files.pharo.org/sources/PharoV60.sources.zip'
	'http://files.pharo.org/vm/pharo-spur32/linux/stable-20170703.zip')

md5sums=('ba84826ecafc18142e4406f43d0b0102'
         '3235e30002cb8be5666a1190bd27be2c'
	 'bb73eeacd4376876e63d0ff5d9821168')

package() {
  cd $srcdir/
  pharo_version=`ls $srcdir/lib/pharo`
  mkdir -p $pkgdir/usr/lib/pharo/$pharo_version/
  mkdir -p $pkgdir/usr/bin/


  cp -fr $srcdir/lib/pharo/$pharo_version/* $pkgdir/usr/lib/pharo/$pharo_version/
  cp $srcdir/PharoV50.sources $pkgdir/usr/lib/pharo/$pharo_version/
  cp $srcdir/PharoV60.sources $pkgdir/usr/lib/pharo/$pharo_version/
  chmod +x $pkgdir/usr/lib/pharo/$pharo_version/pharo

  chgrp -R users $pkgdir/usr/lib/pharo/$pharo_version/
  chmod -R 775 $pkgdir/usr/lib/pharo/$pharo_version/

  ln -s /usr/lib/pharo/$pharo_version/pharo $pkgdir/usr/bin/pharo-spur
}
