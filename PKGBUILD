# Contributor: Laurent Laffont <laurent.laffont@gmail.com>
# Contributor: Eric Forgeot < http://anamnese.online.fr >
# Contributor: Daniel Milde <daniel@milde.cz>

pkgname=pharo-vm-latest
pkgver=4.0
pkgrel=2
pkgdesc="Up to date Pharo-VM from Continuous integration server. Pharo is a clean, innovative, open-source Smalltalk-inspired environment"
conflicts=('pharo')
arch=(i686 x86_64)
source=($pkgname-$pkgver.tar.gz)
url="http://www.pharo-project.org/"
license=('MIT')
if [ "$CARCH" = "x86_64" ]; then
  depends=('lib32-alsa-lib' 'lib32-libvorbis' 'lib32-pango' 'lib32-mesa' 'lib32-dbus-core' 'lib32-libxml2' 'wget' 'unzip')
else
  depends=('alsa-lib' 'libvorbis' 'pango' 'mesa' 'dbus-core' 'libxml2' 'wget' 'unzip')
fi

source=(http://files.pharo.org/sources/PharoV30.sources.zip
        http://files.pharo.org/sources/PharoV40.sources.zip)

md5sums=( 'bb0a66b8968ef7d0da97ec86331f68c8'
          'f748553d42c7dda963d56286e3be3f08')

package() {
  cd $srcdir/
  wget http://files.pharo.org/vm/pharo/linux/latest.zip
  unzip latest.zip
  mkdir -p $pkgdir/usr/share/pharo-vm/
  mkdir -p $pkgdir/usr/bin/

  cp -fr $srcdir/* $pkgdir/usr/share/pharo-vm/
  rm $pkgdir/usr/share/pharo-vm/*.zip
  chmod +x $pkgdir/usr/share/pharo-vm/pharo

  chgrp -R users $pkgdir/usr/share/pharo-vm/
  chmod -R 775 $pkgdir/usr/share/pharo-vm/

  ln -s /usr/share/pharo-vm/pharo $pkgdir/usr/bin/pharo
}
