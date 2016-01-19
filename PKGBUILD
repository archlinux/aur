# Maintainer: CTech <ctech.exe@gmail.com>

pkgname=storm-launcher
pkgver=1.2
pkgrel=1
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
	'polkit'
	'gksu')
provides=('stormLauncher')
conflicts=('storm-launcher-git')
source=("$pkgname::https://github.com/7CTech/stormLauncher/archive/$pkgver.zip")
sha256sums=('8226c59045db72bbe21b9384ec52e81d4a4690d76bb718ba91529ac4cf56a3f9')

pkgver() {
  cd "$srcdir/stormLauncher-$pkgver"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/stormLauncher-$pkgver"
  mv stormLauncher.py stormLauncher
  chmod +x stormLauncher
}

package() {
  cd "$srcdir/stormLauncher-$pkgver"
  install -Dm755 stormLauncher 		"$pkgdir/usr/bin/stormLauncher"
  install -Dm644 stormLauncher.png 	"$pkgdir/etc/stormLauncher/stormLauncher.png"
  install -Dm644 warcry.wav 		"$pkgdir/etc/stormLauncher/warcry.wav"
  install -Dm644 Icon.png		"$pkgdir/etc/stormLauncher/Icon.png"
  install -Dm644 USBLauncher.desktop 	"$pkgdir/usr/share/applications/USBLauncher.desktop"
  install -Dm644 USAGE	 		"$pkgdir/usr/share/doc/stormLauncher/USAGE"
}
