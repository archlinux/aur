# Maintainer: grgergo <gergo@tutanota.de>

pkgname=pico-sdk-git
_pkgname=pico-sdk
pkgver=1.5.1.r0.g6a7db34
pkgrel=2
pkgdesc='Raspberry Pi Pico C SDK'
license=('BSD-3-Clause')
arch=('x86_64')
url='https://www.raspberrypi.com/documentation/pico-sdk/'
options=(!strip)

depends=('arm-none-eabi-binutils' 'arm-none-eabi-gcc' 'arm-none-eabi-newlib' 'cmake')
conflicts=('raspberry-pico-sdk-git' 'pico-sdk')
provides=('pico-sdk' 'raspberry-pico-sdk-git')

source=('git+https://github.com/raspberrypi/pico-sdk'
        'pico-sdk.sh')
sha256sums=('SKIP'
            '8610406fc529818eb2f67163e19a7204cda36f8cd7ed77fb4a65154918de3acb')

prepare() {
	cd "$_pkgname"
	git submodule init
	git submodule update
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/share"
	cp -r "$srcdir/$_pkgname" "$pkgdir/usr/share/$_pkgname"
	install -Dm755 "$srcdir/$_pkgname.sh" "$pkgdir/etc/profile.d/$_pkgname.sh"
}
