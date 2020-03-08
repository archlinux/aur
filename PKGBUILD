# Maintainer: Philipp Hochmann <phil.hochmann[ät]gmail[dot]com>
pkgname=ccalc
pkgver=1.5.0
pkgrel=1
epoch=
pkgdesc="Scientific calculator in which you can define new functions and constants"
arch=('x86_64')
url="https://github.com/PhilippHochmann/Calculator"
license=('GPL3')
groups=()
depends=('readline')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('ca56a7612da5fa50ff5b69e0569a4b78')
validpgpkeys=()

prepare() {
	echo "Nothing to prepare"
}

build() {
	# - - - - - - - Build configuration - - - - - - -
	use_readline=true
	# - - - - - - - - - - - - - - - - - - - - - - - -

	LFLAGS="-lm"
	DEFINES=""
	CFLAGS="-std=c99 -Wall -Wextra -Werror -pedantic"
	FILES="*/*.c *.c"
	BIN="ccalc"

	if [ "$use_readline" = true ]; then
		LFLAGS="$LFLAGS -lreadline"
		DEFINES="$DEFINES -DUSE_READLINE"
	fi

	cd "$pkgname-$pkgver"
	gcc $DEFINES -O3 $CFLAGS $FILES -o $BIN $LFLAGS
}

check() {
	cd "$pkgname-$pkgver"
	if test ! -f ccalc; then
		echo "Compilation error"
	fi
}

package() {
	mkdir -p $pkgdir/usr/bin/
	mv "$pkgname-$pkgver"/ccalc $pkgdir/usr/bin
}
