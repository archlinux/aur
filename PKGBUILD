# $Id$
# Maintainer: Joey Pabalinas <alyptik@protonmail.com>

pkgname=myrrdin-mc-git
_pkgname=${pkgname%-*}
pkgver=r0.3.1.r28.g38727e953df2c11f56
pkgrel=1
pkgdesc='The Myrddin Compiler - development branch'
url='https://eigenstate.org/myrddin/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('gcc' 'readline' 'libelf')
source=("${_pkgname}::git+https://github.com/oridb/mc")
sha256sums=('SKIP')
options=('zipman')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags  2>/dev/null | sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
	cd "$srcdir/$_pkgname"
	./configure \
		--prefix=/usr \
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}
