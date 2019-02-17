# Maintainer: Joel Pettersson <petterssonjoel@gmail.com>

pkgname=bruteforce-luks
pkgver=1.3.1
pkgrel=1
pkgdesc='Try to find the password of a LUKS encrypted volume.'
arch=('x86_64')
url='https://github.com/glv2/bruteforce-luks'
license=('GPL3')
depends=('cryptsetup')
source=("$pkgname-$pkgver.tar.gz::https://github.com/glv2/bruteforce-luks/archive/$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/glv2/bruteforce-luks/releases/download/$pkgver/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('a6008ed1bfd016ef796e1984f156270b1f96be29caea72d8b06bd1d255679b31'
            '2402040a2f756facc7077a09be84686bc186341f1233dfddd208b513d5220219')
validpgpkeys=('8D7B2F5D0B2576447752AFAF3142FA49A297039D') # Guillaume LE VAILLANT <guillaume.le.vaillant@openmailbox.org>

prepare() {
	cd "$pkgname-$pkgver"
	autoreconf --force --install
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
