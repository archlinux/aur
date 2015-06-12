# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=bridge-constructor
pkgver=2.6
_buildver=1390863101
pkgrel=1
pkgdesc="Become an appraised bridge engineer and architect in Bridge Constructor"
url="http://www.bridgeconstructor.com/"
arch=('any')
license=('custom')
test $CARCH == 'x86_64' && depends+=('lib32-alsa-plugins')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://bridgeconstructor_linux_$_buildver.zip"
        'launcher.sh'
        'bridge-constructor.desktop')

md5sums=('717e29d38044294e818c65faf1efec41'
         'f532d185e70f1c279a67131f535e9ec5'
         'bd8b4f4038bff824151bdec25adfb6ab')

package() {
  # Install game files
  mkdir -p "$pkgdir"/opt/$pkgname
  cp -r BridgeConstructor_Data/ "$pkgdir"/opt/$pkgname/
  install -Dm755 BridgeConstructor.x86 "$pkgdir"/opt/$pkgname/

  # Install launcher script
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/$pkgname

  # Install icon
  install -Dm644 BridgeConstructor_Data/Resources/UnityPlayer.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # Install desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
