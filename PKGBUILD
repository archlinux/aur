# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=aclock-git
pkgver=r91.d8802be
pkgrel=1
pkgdesc="Ascii analog clock for text console displays, terminals and terminal emulators"
arch=('x86_64' 'aarch64')
url="https://github.com/tenox7/aclock"
license=('Apache-2.0')
depends=('ncurses')
makedepends=('gcc' 'git')
provides=('aclock')
conflicts=('aclock')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "aclock"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "aclock"
	gcc $CFLAGS $LDFLAGS sources/aclock-unix-curses.c -o aclock -lncurses -lm
}

package() {
	cd "aclock"
	install -Dm755 aclock "$pkgdir/usr/bin/aclock"
	install -Dm644 README.md "$pkgdir/usr/share/doc/aclock/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
