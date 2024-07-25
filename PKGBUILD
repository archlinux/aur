# Maintainer: aksr <aksr at t-com dot me>
pkgname=bgrep-git
pkgver=0.2.r86.g4401646
pkgrel=3
pkgdesc='Binary Grep'
arch=('i686' 'x86_64')
url='https://github.com/rsharo/bgrep'
license=('BSD')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^bgrep.//'
}

build() {
	cd "$srcdir/$pkgname"
	./remove_cruft.sh
	./bootstrap
	./configure
	make
}

check() {
	cd "$srcdir/$pkgname/test"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" prefix="/usr" install
}
