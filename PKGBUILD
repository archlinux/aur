pkgname=horse-game
pkgver=4.3
pkgrel=2
pkgdesc="My Little Pony adventure game"
arch=(i686 x86_64)
url="http://www.equidev.net/"
license=("custom")
depends=(libgl gtk2)
if [ $CARCH = i686 ]; then
	source=("HorseGameU$pkgver-32.tar.gz::http://equidev.net/scripts/download.php?os=linux" "$pkgname.png" "$pkgname.desktop")
	md5sums=('99be5f8a973ecda75a7dc8ff6141815c'
         'a26d293bb88b4711ac7c16f143cc0367'
         'e1850f743f0f101b0197c2162fa16ec7')
else
	source=("HorseGameU$pkgver-64.tar.gz::http://equidev.net/scripts/download.php?os=linux64" "$pkgname.png" "$pkgname.desktop")
	md5sums=('f9c257214bf9d4ebda4a63713a9a5967'
         'a26d293bb88b4711ac7c16f143cc0367'
         'e1850f743f0f101b0197c2162fa16ec7')
fi

package() {
  if [ $CARCH = i686 ]; then
		find "HorseGame - U$pkgver - Linux 32_Data" -type f -exec install -Dm644 {} "$pkgdir/opt/horsegame/"{} \;
		install -m755 "HorseGame - U$pkgver - Linux 32.x86" "$pkgdir/opt/horsegame/"
		mkdir -p "$pkgdir/usr/bin"
		ln -s "/opt/horsegame/HorseGame - U$pkgver - Linux 32.x86" "$pkgdir/usr/bin/horsegame"
  else
		find "HorseGame - U$pkgver - Linux 64_Data" -type f -exec install -Dm644 {} "$pkgdir/opt/horsegame/"{} \;
		install -m755 "HorseGame - U$pkgver - Linux 64.x86_64" "$pkgdir/opt/horsegame/"
		mkdir -p "$pkgdir/usr/bin"
		ln -s "/opt/horsegame/HorseGame - U$pkgver - Linux 64.x86_64" "$pkgdir/usr/bin/horsegame"
  fi
  
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 $pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
