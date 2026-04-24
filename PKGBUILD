# Maintainer: aksr <aksr88 at gmail dot com>
pkgname=csnobol4-git
pkgver=r4485.a560be66
pkgrel=1
pkgdesc='Original Bell Telephone Labs Macro SNOBOL4 ported to C'
arch=('i686' 'x86_64')
url='https://github.com/philbudne/csnobol4'
license=('BSD-2-Clause')
depends=('tcl' 'tk')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	./configure --prefix=/usr --lp64 --with-tcl=/usr/lib/tclConfig.sh
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir/" install
}
