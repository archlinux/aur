# Maintainer: Yaohan Chen <yaohan.chen@gmail.com>
pkgname=tothemoon-hib
pkgver=1389114090
pkgrel=2
pkgdesc="An indie Adventure RPG, about two doctors traversing through the memories of a dying man to fulfill his last wish."
arch=(i686 x86_64)
url="http://freebirdgames.com/to_the_moon/"
license=('custom:Commercial')
depends=()
_installer=ToTheMoon_linux_${pkgver}.sh
source=(hib://$_installer tothemoon.desktop tothemoon.sh)
md5sums=('706a5c9467328438d412370ffb1454de'
         '420880f33ee61863b926d10501141ae6'
         'bae0487d388dc529abd740b7371cf566')
options=(!upx !strip)

package() {
  cd $srcdir/data

  # icon
  _pixmapsdir=$pkgdir/usr/share/pixmaps/
  install -d $_pixmapsdir
  mv noarch/ToTheMoon.png $_pixmapsdir/tothemoon.png

  # license
  _licensesdir=$pkgdir/usr/share/licenses/tothemoon-hib
  install -d $_licensesdir
  mv noarch/LICENSE.txt noarch/COPYING* $_licensesdir

  # launcher
  install -Dm755 $srcdir/tothemoon.sh $pkgdir/usr/bin/tothemoon
  install -Dm644 $srcdir/tothemoon.desktop $pkgdir/usr/share/applications/tothemoon.desktop

  # data
  _installdir=$pkgdir/opt/tothemoon
  install -d $pkgdir/opt/
  mv noarch $_installdir
  find $_installdir -exec chmod +r '{}' ';'
  find $_installdir -type d -exec chmod +x '{}' ';'

  # ELF
  case $CARCH in
    i686)
      mv x86/ToTheMoon.bin.x86 $_installdir/ToTheMoon.bin
      mv x86/lib $_installdir
      ;;
    x86_64)
      mv x86_64/ToTheMoon.bin.x86_64 $_installdir/ToTheMoon.bin
      mv x86_64/lib64 $_installdir
      ;;
  esac
}

