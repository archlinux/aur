# Maintainer: JSH <jsh 6 7 8 9 at gmail dot com>
pkgname=rasterview-git
pkgver=1.8.r14.g6e4e24c
pkgrel=1
epoch=1
pkgdesc="A CUPS, PWG, and Apple raster file viewer"
arch=('x86_64')
url="https://github.com/michaelrsweet/rasterview"
license=('APACHE')
depends=('fltk>=1.3')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf --force --install
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" install
}
