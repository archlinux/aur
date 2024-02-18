# Previous Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Elmar Klausmeier <Elmar.Klausmeier@gmail.com>
# Contributor: Andrew Boktor <andrew.boktor@gmail.com>
# Contributor: Dmitry Kharitonov <darksab0r@gmail.com>

pkgname=makedepend
pkgver=1.0.9
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
sha256sums=('bc94ffda6cd4671603a69c39dbe8f96b317707b9185b2aaa3b54b5d134b41884')
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

