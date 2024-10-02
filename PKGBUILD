# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatjson-git
pkgver=r2.10bf461
pkgrel=1
pkgdesc='A small program to work with JSON-encoded data'
arch=('i686' 'x86_64')
url='https://github.com/aligrudi/json'
license=('ISC')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$pkgname"
	sed -i 's/json/neat&/g' test.sh
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 json $pkgdir/usr/bin/neatjson
	install -D -m644 test.sh $pkgdir/usr/share/doc/${pkgname%-*}/test.sh
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
