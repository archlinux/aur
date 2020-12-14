# Maintainer: Emil Renner Berthing <esmil@mailme.dk>

pkgname=bootterm-git
pkgver=0.1+3
pkgrel=1
pkgdesc="Simple, reliable and powerful serial terminal"
arch=(x86_64)
url="https://github.com/wtarreau/bootterm"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make' 'git')
provides=('bootterm')
conflicts=('bootterm')
source=('git+https://github.com/wtarreau/bootterm.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/bootterm"

	local ver="$(git describe --tags)"
	ver="${ver#v}"
	ver="${ver%-*}"
	echo "${ver//-/+}"
}

build() {
	cd "$srcdir/bootterm"
	make V=1 CFLAGS="$CFLAGS $CPPFLAGS" LDFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/bootterm"
	make V=1 DESTDIR="$pkgdir" PREFIX=/usr install
}

# vim: ts=2 sw=2 noet:
