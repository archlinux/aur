# Maintainer: Philipp Hochmann <phil.hochmann[ät]gmail[dot]com>
pkgname=ccalc
pkgver=1.5.1
pkgrel=1
epoch=
pkgdesc="Scientific calculator in which you can define new functions and constants"
arch=('x86_64')
url="https://github.com/PhilippHochmann/ccalc"
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
md5sums=('867a3280c9c296606a7eb7c016264c16')
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
	FILES="src/*/*.c src/*.c"
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
