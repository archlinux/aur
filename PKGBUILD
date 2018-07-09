# Maintainer: Nathan Lilienthal <nathan@nixpulvis.com>
pkgname=avrm-git
pkgver=0.0.5.r39.g1f47881
pkgrel=1
pkgdesc="Bare metal AVR library and Makefile"
arch=('any')
url="https://github.com/nixpulvis/avrm"
depends=('avr-gcc' 'avr-binutils' 'avr-libc')
optdepends=('avrdude: for flashing code to devices')
makedepends=('git')
provides=('avrm')
conflicts=('avrm')
options=('!strip')
source=('git+https://github.com/nixpulvis/avrm')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX="$pkgdir/usr/avr/" install

	# TODO: Fix this in avrm upstream.
	mkdir "$pkgdir/usr/avr/share"
	mv "$pkgdir/usr/avr/Makefile" "$pkgdir/usr/avr/share/Makefile"
}
