# Maintainer: aksr <aksr at t-com dot me>
pkgname=outils-git
pkgver=0.13.r2.g6864fc3
pkgrel=1
pkgdesc='A port of some non-standard OpenBSD tools to Linux.'
arch=('i686' 'x86_64')
url='https://github.com/chneukirchen/outils'
license=('custom')
makedepends=('git' 'openssl')
source=("$pkgname::git+$url")
md5sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's@/share/man@/man@g' Makefile
}

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr/outils" install
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
