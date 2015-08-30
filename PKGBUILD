# Maintainer: Alexander Schnaidt <alex.schnaidt at gmail dot com>
# Contributor: Linus Karlsson <arch at zozs dot se>
# Contributor: Peter Hultqvist <endnode dot se>
pkgname=ykpers
pkgver=1.17.1
pkgrel=1
pkgdesc="A small library for personalization of Yubico's USB key"
arch=('i686' 'x86_64' 'armv6h')
url="http://yubico.github.io/yubikey-personalization"
license=('custom:BSD')
depends=('libyubikey')
options=('!libtool')
source=(https://developers.yubico.com/yubikey-personalization/Releases/$pkgname-$pkgver.tar.gz
	https://developers.yubico.com/yubikey-personalization/Releases/$pkgname-$pkgver.tar.gz.sig)
sha256sums=('556baec2bbc94bae01293e64dc3873d68f880119ea5c3772737e4f3dc44f69c4'
            'SKIP')
validpgpkeys=(0A3B0262BCA1705307D5FF06BCA00FD4B2168C0A) # Klas Lindfors <klas@yubico.com>

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --with-udevrulesdir=/usr/lib/udev/rules.d
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	install -D -m0644 $srcdir/$pkgname-$pkgver/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

