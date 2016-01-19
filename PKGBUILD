# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=storm-launcher
pkgver=1.1.1
pkgrel=3
pkgdesc="Software to control Dream Cheeky O.I.C Storm & Thunder USB Missile Launchers"
arch=('i686' 'x86_64')
url="https://github.com/7CTech/stormLauncher"
license=('ASF 2.0')
depends=('python' 
	'python-pygame' 
	'python-imaging' 
	'python-pillow' 
	'python-pyusb' 
	'tk'
	'polkit')
provides=('stormLauncher')
conflicts=('storm-launcher-git')
source=("$pkgname::https://github.com/7CTech/stormLauncher/archive/$pkgver.zip")
sha256sums=('88f17ea88fa6fb663186f34620e94ffcb90281c5735b076012926379db2b8b88')

pkgver() {
  cd "$srcdir/stormLauncher-1.1"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/stormLauncher-1.1"
  mv stormLauncher.py stormLauncher
  chmod +x stormLauncher
  chmod +x stormLauncher-polkit
}

package() {
  cd "$srcdir/stormLauncher-1.1"
  install -Dm755 stormLauncher 		"$pkgdir/usr/bin/stormLauncher"
  install -Dm755 stormLauncher-polkit 	"$pkgdir/usr/bin/stormLauncher-polkit"
  install -Dm644 stormLauncher.png 	"$pkgdir/etc/stormLauncher/stormLauncher.png"
  install -Dm644 warcry.wav 		"$pkgdir/etc/stormLauncher/warcry.wav"
  install -Dm644 Icon.png		"$pkgdir/etc/stormLauncher/Icon.png"
  install -Dm644 USBLauncher.desktop 	"$pkgdir/usr/share/applications/USBLauncher.desktop"
  install -Dm644 USAGE	 		"$pkgdir/usr/share/doc/stormLauncher/USAGE"
}
