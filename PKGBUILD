# Maintainer: aksr <aksr at t-com dot me>
pkgname=agrep-git
pkgver=r34.b7d180f
pkgrel=1
pkgdesc='Approximate GREP for fast fuzzy string searching.'
arch=('i686' 'x86_64')
url='https://github.com/Wikinaut/agrep'
license=('ISC')
makedepends=('git' 'unzip')
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
	install -D -m755 agrep "$pkgdir/usr/bin/agrep"
	install -D -m644 COPYRIGHT "$pkgdir/usr/share/licenses/${pkgname%-*}/COPYRIGHT"
	cd docs/
	unzip -d $pkgname agrep-and-glimpse-docs.zip
	install -D -m644 $pkgname/agrep.1 "$pkgdir/usr/share/man/man1/agrep.1"
}
