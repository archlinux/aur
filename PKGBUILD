# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=canabalt
pkgver=1.0
_buildver=1331587946
pkgrel=2
pkgdesc="It's going to be quite some time before you find something so simple so thrilling again."
url="http://canabalt.com/"
arch=('any')
license=('custom')
depends=('adobe-air')
test $CARCH == 'x86_64' && depends+=('lib32-alsa-plugins')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://Canabalt2P_AIR-$_buildver.air"
        'launcher.sh'
        'Canabalt.png'
        'canabalt.desktop')

md5sums=('715cc145adef541ba1587665fee4ed62'
         '4f86401733018352edfc40991e3b5b93'
         'dd560da377827bf764cce40e141198db'
         'a9ebbb589499fd1565a6a1b2cc659ff0')
         
noextract=("Canabalt2P_AIR-$_buildver.air")

_archive_subdir="bit.trip.runner-1.0";
_installname="canabalt"

package() {
  # Install game files
  mkdir -p "$pkgdir"/opt/$pkgname
  cp Canabalt2P_AIR-1331587946.air "$pkgdir"/opt/$pkgname

  # Install launcher script
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/$pkgname

  # Install icon
  install -Dm644 Canabalt.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # Install desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
