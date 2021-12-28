# Maintainer: klanc <lewis at ledgedash dot com>

pkgname=slippi-online-appimage
pkgver=2.3.3
pkgrel=0
pkgdesc='Slippi fork of Faster Melee, which allows you to play rollback netplay on Super Smash Bros Melee, (automatically gets latest version)'
arch=('x86_64')
url='https://slippi.gg/'
license=('GPL2')
provides=('slippi-online')
depends=(
	'alsa-lib' 'bluez-libs' 'enet' 'hidapi' 'libevdev' 'libgl' 'libpng'
	'libpulse' 'libx11' 'libxi' 'libxrandr' 'lzo' 'mbedtls' 'pugixml' 'qt5-base'
	'sfml' 'zlib' 'fuse2'
)
makedepends=('wget')
optdepends=('pulseaudio: PulseAudio backend')
options=('!strip')
source=('launch_script.sh')
sha1sums=('afcaa99c1e8a3c6c55a2e9666d8baf7dd4dd21f8')

prepare() {
  slippiver=$(curl --silent "https://api.github.com/repos/project-slippi/Ishiiruka/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')
  if [ -z "$slippiver" ]; then
    slippiver=$pkgver
  fi
  wget "https://github.com/project-slippi/Ishiiruka/releases/download/v$slippiver/Slippi_Online-x86_64.AppImage" -O Slippi_Online-x86_64.AppImage
}

pkgver() {
  slippiver=$(curl --silent "https://api.github.com/repos/project-slippi/Ishiiruka/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//')
  if [ -z "$slippiver" ]; then
    slippiver=$pkgver
  fi
  echo $slippiver
}

package() {
  install -Dm755 Slippi_Online-x86_64.AppImage "$pkgdir/usr/lib/slippi-online/slippi-online"
  install -Dm755 launch_script.sh "$pkgdir/usr/bin/slippi-online"
}
