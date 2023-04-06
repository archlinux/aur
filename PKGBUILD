# Maintainer: aksr <aksr at t-com dot me>
pkgname=lr-git
pkgver=1.5.1.r248.5af9b79
pkgrel=1
pkgdesc="List files, recursively"
arch=('i686' 'x86_64')
url='https://github.com/chneukirchen/lr'
license=('MIT')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --tags | sed -E 's/^v//;s/-.*//')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
	install -D -m644 contrib/lr.el $pkgdir/usr/share/${pkgname%-*}/lr.el
	install -D -m644 contrib/lr.vim $pkgdir/usr/share/${pkgname%-*}/lr.vim
	install -D -m755 contrib/lrls $pkgdir/usr/share/${pkgname%-*}/lrls
	install -D -m755 contrib/lrocate $pkgdir/usr/share/${pkgname%-*}/lrocate
}
