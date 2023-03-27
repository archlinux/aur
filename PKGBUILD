# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Ivan Smolyakov <smol.ivan97@gmail.com>

pkgname=mcron
pkgver=1.2.3
pkgrel=1
pkgdesc="Pure Guile, compatible replacement for cron"
url="https://gnu.org/software/mcron/"
arch=('x86_64')
license=('GPL3')
depends=('guile')
provides=('cron')
conflicts=('cron')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::https://ftp.gnu.org/gnu/mcron/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://ftp.gnu.org/gnu/mcron/$pkgname-$pkgver.tar.gz.sig")
sha256sums=('1bc8c0d362d3b1a30fa0071d7fab696bbfc1da1ed536c42e0480bb9ffd22154e'
            'SKIP')
validpgpkeys=('961AB15C62EF3B92DAB5965988C3D2BEA81462EB') ## Adam Bilbrough

build() {
	cd "$pkgname-$pkgver"
	./configure \
		--prefix=/usr \
		--sbindir=/usr/bin \
		--libexecdir=/usr/lib/mcron
	make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

check() {
	make -C "$pkgname-$pkgver" check
}

package() {
	make -C "$pkgname-$pkgver" install DESTDIR="$pkgdir"
}
