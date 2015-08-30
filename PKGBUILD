# Maintainer: Linus Karlsson <arch at zozs dot se>
# Contributor: Peter Hultqvist <endnode dot se>
pkgname=ykpers
pkgver=1.15.1
pkgrel=1
pkgdesc="A small library for personalization of Yubico's USB key"
arch=('i686' 'x86_64' 'armv6h')
url="http://yubico.github.io/yubikey-personalization"
license=('custom:BSD')
depends=('libyubikey')
options=('!libtool')
source=(
	http://yubico.github.io/yubikey-personalization/releases/$pkgname-$pkgver.tar.gz
)
sha1sums=('dd1478cc106c624318dfe74bb2beda54f18f1fc8')
sha256sums=('80cd384696007be5d195be7fe646b9bd64bcd65d2fadc29e9c55f6862c87dff5')

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

