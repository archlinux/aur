# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jeff Mickey <j@codemac.net>
# Contributor: Ben Mazer <blm@groknil.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lwm
pkgver=1.2.4
pkgrel=4
pkgdesc="A very light weight window manager"
arch=('x86_64')
url="http://www.jfc.org.uk/software/lwm.html"
license=('GPL')
depends=('xorg-server' 'libxext' 'libsm')
makedepends=('imake')
source=(http://www.jfc.org.uk/files/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('69fc645ded46b6801092183e01be8518')
sha256sums=('7ec05d5572c90340335a586e7a227b561512f21b7710ea5d30f401374ec88dad')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	xmkmf
	sed -i 's/^LOCAL_LIBRARIES.*/& $(ICELIB)/' Makefile
	make
	strip lwm
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 lwm "$pkgdir/usr/bin/lwm"
	install -Dm644 lwm.man "$pkgdir/usr/share/man/man1/lwm.1"
}
