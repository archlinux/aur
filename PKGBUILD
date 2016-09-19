# Maintainer: Jestine Paul <jestine dot paul at gmail dot com>
pkgname=libcs50-git
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc="CS50 Library for C (Harvard course)"
arch=('x86_64' 'i686')
url="https://cs50.harvard.edu/"
license=('unknown')
groups=()
depends=('glibc')
makedepends=('git')
checkdepends=()
optdepends=()
provides=('libcs50')
conflicts=('lib50-c-git' 'lib50-c')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+https://github.com/cs50/lib50-c.git)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "$srcdir/lib50-c"

	# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "lib50-c"
	make build
}

package() {
	install -dm755 "$pkgdir/"{usr/include,usr/lib,usr/share/man/man3}
	install -Dm644 "$srcdir/lib50-c/build/usr/lib/libcs50.so" "$pkgdir/usr/lib/libcs50.so"
	install -Dm644 "$srcdir/lib50-c/build/usr/include/cs50.h" "$pkgdir/usr/include/cs50.h"

	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/eprintf.3" "$pkgdir/usr/share/man/man3/eprintf.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_char.3" "$pkgdir/usr/share/man/man3/get_char.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_double.3" "$pkgdir/usr/share/man/man3/get_double.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_float.3" "$pkgdir/usr/share/man/man3/get_float.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_int.3" "$pkgdir/usr/share/man/man3/get_int.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_long_long.3" "$pkgdir/usr/share/man/man3/get_long_long.3"
	install -Dm644 "$srcdir/lib50-c/build/usr/share/man/man3/get_string.3" "$pkgdir/usr/share/man/man3/get_string.3"
}
