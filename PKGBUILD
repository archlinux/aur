# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>

## GPG key: https://github.com/jaharkes.gpg

pkgname=lwp
pkgver=2.17
pkgrel=1
pkgdesc="Lightweight process library"
arch=('x86_64')
url='https://github.com/cmusatyalab/coda'
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('liblwp.so')
changelog=NEWS
source=("$pkgname::git+$url#tag=$pkgname-$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('4EEDEE4D29DAE8A18CAFDA18BEC621B96C853813') ## Jan Harkes

build() {
	cd "$pkgname/lib-src/$pkgname"
	./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname/lib-src/$pkgname"
	make DESTDIR="$pkgdir" install
	install -Dm644 AUTHORS README -t "$pkgdir/usr/share/doc/$pkgname/"
}
