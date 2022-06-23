# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=rpc2
pkgver=2.37
pkgrel=1
pkgdesc="Remote procedure call package for IP/UDP"
arch=('x86_64')
url='https://github.com/cmusatyalab/coda'
license=('GPL')
depends=('lwp' 'readline')
makedepends=('git' 'perl')
provides=('librpc2.so' 'libse.so')
changelog=NEWS
source=("coda-common::git+$url#tag=$pkgname-$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('4EEDEE4D29DAE8A18CAFDA18BEC621B96C853813') ## Jan Harkes

build() {
	cd "coda-common/lib-src/$pkgname/"
	./bootstrap.sh
	./configure --prefix=/usr
	make CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}"
}

package() {
	cd "coda-common/lib-src/$pkgname/"
	make DESTDIR="$pkgdir" install
	install -Dm644 AUTHORS -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 README.ipv6 "$pkgdir/usr/share/doc/$pkgname/README"
}
