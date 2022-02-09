# Maintainer: Prokop Randáček <prokop@randacek.dev>
pkgname=libucw-git
pkgver=v6.5.13.r2.dcc163ae
pkgrel=1
pkgdesc='General purpose library for the C language'
arch=('any')
url='http://www.ucw.cz/libucw/'
license=('LGPL')
depends=()
makedepends=(perl pkgconf coreutils gcc git make asciidoc)
provides=(libucw)
source=('libucw::git+git://git.ucw.cz/libucw.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure PREFIX=/usr -CONFIG_DOC
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

