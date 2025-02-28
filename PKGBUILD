# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=pdpmake
pkgdesc='Publix Domain POSIX Make'
pkgver=2.0.3
pkgrel=1
license=()
depends=(glibc)
url=https://frippery.org/make
source=("$url/$pkgname-$pkgver.tgz")
b2sums=('e0828bc721d2825efb1c507d9f128d6968417a1e5279540ae7cde7ed13026c805227ca0fcb665d04a8f27a73a610b8cf6822a0eb74d38c245b7fe73f3082069d')

build () {
	cd "$pkgname-$pkgver"

	# Bootstrap.
	${CC:-gcc} ${CFLAGS} ${LDFLAGS} ${CPPFLAGS} -o make0 *.c

	# Build the version that gets installed.
	./make0 PREFIX=/usr
}

package () {
	cd "$pkgname-$pkgver"
	./make0 PREFIX=/usr DESTDIR="$pkgdir" install
}
