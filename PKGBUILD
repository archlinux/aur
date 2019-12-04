# Maintainer: Ryan Farley <ryan.farley@gmx.com>
# Contributor: Andreas Bosch (progandy) <linux+aur@progandy.de>
pkgname=fonttosfnt-git
pkgver=r86.cfb4d64
pkgrel=1
pkgdesc="Convert a set of bdf or pcf fonts into a bitmap only sfnt (otb)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/xorg/app/fonttosfnt"
license=('MIT')
depends=(libfontenc freetype2)
makedepends=(git make autoconf automake xproto xorg-util-macros)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.freedesktop.org/xorg/app/fonttosfnt.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
