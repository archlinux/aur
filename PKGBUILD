# Maintainer: Prokop Randáček <prokop@randacek.dev>
pkgname=libucw-git
pkgver=v6.5.12.r5.87735ccb
pkgrel=1
pkgdesc='General purpose library for the C language'
arch=('any')
url='http://www.ucw.cz/libucw/'
license=('LGPL')
depends=()
makedepends=(perl bash pkgconf coreutils perl gcc git pkg-config curl make bash asciidoc)
provides=(libucw)
source=('libucw::git+git://git.ucw.cz/libucw.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure PREFIX=/usr
	make -j$(nproc)
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}

