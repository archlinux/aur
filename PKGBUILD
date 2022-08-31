# Contributor: Paul Sajna <sajattack@gmail.com>

pkgname='fern-wifi-cracker-git'
pkgver=3.4.r0.g76c64b3
pkgrel=1
groups=('blackarch' 'blackarch-cracker' 'blackarch-wireless')
pkgdesc='WEP, WPA wifi cracker for wireless penetration testing'
arch=('any')
url='https://github.com/savio-code/fern-wifi-cracker'
license=('GPL2')
depends=('python-pyqt5' 'aircrack-ng' 'scapy'
         'macchanger')
makedepends=('git')
conflicts=('fern-wifi-cracker')
provides=('fern-wifi-cracker')
source=("git+https://github.com/savio-code/fern-wifi-cracker.git" "fern")
sha1sums=('SKIP' 'bac416f19d84d8604c9890fedc30aefcf4f18b95')

pkgver() {
	cd "$srcdir/fern-wifi-cracker"
	git describe --long  --tags| sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -D fern -t "$pkgdir/usr/bin/"
	cd fern-wifi-cracker/Fern-Wifi-Cracker
	install -d "$pkgdir/usr/share/fern-wifi-cracker/"
	cp -a --no-preserve=ownership * "$pkgdir/usr/share/fern-wifi-cracker/"
	python -O -m compileall "$pkgdir/"
}
