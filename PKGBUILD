# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatvi-git
pkgver=r375.9a9aa22
pkgrel=1
pkgdesc='A small vi/ex editor for editing bidirectional UTF-8 text.'
arch=('i686' 'x86_64')
url='https://github.com/aligrudi/neatvi'
license=('ISC')
makedepends=('git')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

check() {
	cd "$srcdir/$pkgname"
	./test.sh
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 vi $pkgdir/usr/bin/neatvi
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
