# Maintainer: aksr <aksr at t-com dot me>
pkgname=se-git
pkgver=3.0.1.r47.g0d06c10
pkgrel=1
pkgdesc='A screen oriented version of the classic UNIX text editor ed.'
arch=('i686' 'x86_64')
url='https://github.com/screen-editor/se'
license=('publicdomain')
depends=('ncurses')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^se.//'
}

build() {
	cd "$srcdir/$pkgname"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
