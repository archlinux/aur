# Maintainer: aksr <aksr at t-com dot me>
pkgname=tumble-git
pkgver=0.38.r1.gd4a9738
pkgrel=1
pkgdesc='A utility to construct PDF files from one or more image files.'
arch=('i686' 'x86_64')
url='https://github.com/brouhaha/tumble'
license=('GPL')
depends=('libtiff')
makedepends=('git')
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 tumble $pkgdir/usr/bin/tumble
	install -D -m644 README $pkgdir/usr/share/doc/${pkgname%-*}/README
	install -D -m644 CHANGELOG.md $pkgdir/usr/share/doc/${pkgname%-*}/CHANGELOG.md
	install -D -m644 TODO $pkgdir/usr/share/doc/${pkgname%-*}/TODO
}
