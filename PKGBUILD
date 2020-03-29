# Previous Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Andrew Boktor <andrew.boktor@gmail.com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>

pkgname=makedepend
pkgver=1.0.6
pkgrel=2
pkgdesc="Create dependencies in Makefiles"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.linuxfromscratch.org/blfs/view/7.4/x/makedepend.html"
license=('custom')
depends=('splint')
makedepends=('autoconf'
             'automake'
             'm4'
             'make'
             'pkg-config'
             'xorg-util-macros'
             'xorgproto')
source=(http://xorg.freedesktop.org/archive/individual/util/$pkgname-$pkgver.tar.gz)
sha256sums=('845f6708fc850bf53f5b1d0fb4352c4feab3949f140b26f71b22faba354c3365')
conflicts=('imake')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	msg2 'Building...'
	NOCONFIGURE=1 ./autogen.sh
	./configure \
	  --prefix=/usr \
	  --sbindir=/usr/bin \
	  --libexecdir=/usr/lib/makedepend \
	  --sysconfdir=/etc \
	  --sharedstatedir=/usr/share/makedepend \
	  --localstatedir=/var/lib/makedepend \
	  --with-lint
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	msg2 'Installing license...'
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/makedepend"

	msg2 'Installing...'
	make DESTDIR="$pkgdir" install
}

