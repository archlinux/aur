pkgname=polkit-pkla-compat
pkgver=0.1
pkgrel=2
pkgdesc="Rules for polkit to add compatibility with pklocalauthority"
arch=('i686' 'x86_64')
url="https://pagure.io/$pkgname"
license=('LGPL')
depends=('polkit>=0.106')
makedepends=('docbook-xsl' 'libxslt')
source=("https://releases.pagure.org/$pkgname/$pkgname-$pkgver.tar.xz")
md5sums=('54ac39680327d65ceafa583480ba6d98')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr        \
	            --localstatedir=/var \
	            --sysconfdir=/etc
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

# vim: set ft=sh ts=4 sw=4 noet:
