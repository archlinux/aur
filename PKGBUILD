# Maintainer: Nathan Lilienthal <nathan@nixpulvis.com>
pkgname=avrm-max7221-git
pkgver=0.0.3.r3.g987b94d
pkgrel=1
pkgdesc="AVR library for the Maxis7221 LED driver."
arch=('any')
url="https://github.com/nixpulvis/max7221"
depends=('avrm')
optdepends=('avrdude: for flashing code to devices')
makedepends=('git')
provides=('avrm-max7221')
conflicts=('avrm-max7221')
options=('!strip')
source=('git+https://github.com/nixpulvis/max7221')
md5sums=('SKIP')

pkgver() {
	T="${pkgname%-git}"
	cd "$srcdir/${T#avrm-}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	T="${pkgname%-git}"
	cd "$srcdir/${T#avrm-}"
	make
}

package() {
	T="${pkgname%-git}"
	cd "$srcdir/${T#avrm-}"
	make PREFIX="$pkgdir/usr/avr/" install
}
