# Maintainer: aksr <aksr at t-com dot me>
pkgname=pick-git
pkgver=4.0.0.r32.gcaae959
pkgrel=1
pkgdesc='Fuzzy select anything.'
arch=('i686' 'x86_64')
url='https://github.com/thoughtbot/pick'
license=('MIT')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	BINDIR="/usr/bin" MANDIR="/usr/share/man" ./configure
	make
}

check() {
	cd "$srcdir/$pkgname"
	make -k test
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE"
}
