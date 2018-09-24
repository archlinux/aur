# Maintainer: Nathan Lilienthal <nathan@nixpulvis.com>
pkgname=avrm-ds1307-git
pkgver=0.0.3.r5.g4d73376
pkgrel=1
pkgdesc="AVR library for the Maxim Intergrated DS1307."
arch=('any')
url="https://github.com/nixpulvis/ds1307"
depends=('avrm')
optdepends=('avrdude: for flashing code to devices')
makedepends=('git')
provides=('avrm-ds1307')
conflicts=('avrm-ds1307')
options=('!strip')
source=('git+https://github.com/nixpulvis/ds1307')
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
