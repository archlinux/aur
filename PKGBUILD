# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=ptable-git
pkgver=r57.6c3f178
pkgrel=1
pkgdesc="A beautiful TUI periodic table for GNU/Linux terminals"
arch=('x86_64')
url="https://github.com/velorek1/ptable"
license=('MIT')
depends=('ncurses')
makedepends=('git' 'gcc' 'make' 'pkgconf')
provides=('ptable')
conflicts=('ptable')
source=("ptable::git+https://github.com/velorek1/ptable.git")
sha256sums=('SKIP')
function pkgver() {
	cd ptable
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
function build() {
	cd ptable
	make
}
function package() {
	cd ptable
	install -Dm755 tptable "$pkgdir/usr/bin/ptable"
	if [ -f LICENSE ]; then
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	fi
}
