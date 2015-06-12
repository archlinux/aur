# Maintainer: Lara Maia <lara@craft.net.br>

pkgname=bridge-constructor-playground
pkgver=1.4
_buildver=1411180371
pkgrel=1
pkgdesc="Become an appraised bridge engineer and architect in Bridge Constructor"
url="http://www.bridgeconstructor.com/"
arch=('any')
license=('custom')
test $CARCH == 'x86_64' && depends+=('lib32-alsa-plugins')

DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')

source=("hib://bridgeconstructorPlayground_Linux_v14_$_buildver.zip"
        'launcher.sh'
        'bridge-constructor-playground.desktop')

md5sums=('39f6b4005b7a3fbfb797b6a92017294b'
         '6eba227adbad413655ae338abea3c639'
         'd921a60e1dd0f27abcf4a396e8bbe97f')

package() {
  # Install game files
  mkdir -p "$pkgdir"/opt/$pkgname
  cp -r BridgeConstructorPlayground_Data/ "$pkgdir"/opt/$pkgname/
  install -Dm755 BridgeConstructorPlayground.x86 "$pkgdir"/opt/$pkgname/

  # Install launcher script
  install -Dm755 launcher.sh "$pkgdir"/usr/bin/$pkgname

  # Install icon
  install -Dm644 BridgeConstructorPlayground_Data/Resources/UnityPlayer.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # Install desktop entry
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
