# Maintainer: aksr <aksr at t-com dot me>
pkgname=neatmail-git
pkgver=r110.eb5d1a7
pkgrel=1
pkgdesc="A command-line mail client."
arch=('i686' 'x86_64')
url="http://repo.or.cz/neatmail.git"
license=('ISC')
makedepends=('git')
source=("$pkgname::git+git://repo.or.cz/neatmail.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

check() {
	cd "$srcdir/$pkgname"
	./test.sh
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 mail $pkgdir/usr/bin/neatmail
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
}
