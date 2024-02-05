# Maintainer: aksr <aksr at t-com dot me>
pkgname=sqlrpt-git
pkgver=r20.47652d0
pkgrel=1
pkgdesc='For viewing and printing SQLite output, output can be processed with tbl, with nroff convenient in-terminal viewing.'
arch=('i686' 'x86_64')
url='https://github.com/jklowden/sqlrpt'
license=('BSD')
makedepends=('git')
optdepends=('groff')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 sqlrpt $pkgdir/usr/bin/sqlrpt
	install -D -m644 sqlrpt.1 $pkgdir/usr/share/man/man1/sqlrpt.1
	install -D -m644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}
