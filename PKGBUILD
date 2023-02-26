# Previous Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Andrew Boktor <andrew.boktor@gmail.com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>

pkgname=makedepend
pkgver=1.0.8
pkgrel=1
pkgdesc="Create dependencies in Makefiles"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
#old: url="http://www.linuxfromscratch.org/blfs/view/7.4/x/makedepend.html"
url="https://xorg.freedesktop.org/archive/individual/util/"
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
sha256sums=('275f0d2b196bfdc740aab9f02bb48cb7a97e4dfea011a7b468ed5648d0019e54')
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

