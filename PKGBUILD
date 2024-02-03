# Maintainer: aksr <aksr at t-com dot me>
pkgname=heirloom-ex-vi-git
pkgver=4.1.3.r44.bd1f886
pkgrel=1
pkgdesc='The Traditional Vi (vi with many enhancements from Gunnar Ritter)'
arch=('i686' 'x86_64')
url='https://github.com/n-t-roff/heirloom-ex-vi'
license=('custom:BSD')
makedepends=('git')
conflicts=("${pkgname%-*}" 'heirloom-ex-vi-cvs')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --tags | sed -E 's/-.*//;s/-/./g')" \
		"$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./configure
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr/heirloom" install
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -m644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
