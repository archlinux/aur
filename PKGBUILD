# Maintainer: aksr <aksr at t-com dot me>
pkgname=libregexp-git
pkgver=r25.b50d07a
pkgrel=1
pkgdesc='A Unix port of the Plan 9 regular expression library, originally done for the Inferno operating system.'
arch=('i686' 'x86_64')
url='https://github.com/0intro/libregexp'
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/0intro/libregexp.git")
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
	make PREFIX="$pkgdir/usr" install
	install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
	install -Dm644 NOTICE $pkgdir/usr/share/licenses/${pkgname%-*}/NOTICE
}
