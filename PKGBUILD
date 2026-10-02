# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=bren
pkgver=0.4
pkgrel=1
pkgdesc="Command line bulk file renamer with support for GNU Guile scripting; simple, fast, written in C"
arch=('x86_64' 'aarch64')
url="https://github.com/nrosvall/bren"
license=('GPL-3.0-or-later')
depends=('guile' 'gmp' 'glibc')
makedepends=('gcc' 'pkgconf')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58e302ad8068fce9f0db13df698514705a0f8d64e6186cc12eb77ccdede95a68')

build() {
	cd "$pkgname-$pkgver"
	gcc -std=c99 $CFLAGS $CPPFLAGS $(pkg-config --cflags guile-3.0) bren.c -o bren $LDFLAGS $(pkg-config --libs guile-3.0) -lgmp -lm
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 bren "$pkgdir/usr/bin/bren"
	install -Dm644 bren.1 "$pkgdir/usr/share/man/man1/bren.1"
	install -Dm644 example_guile_script/* -t "$pkgdir/usr/share/doc/$pkgname/example_guile_script"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
