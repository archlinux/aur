# shellcheck shell=bash
# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname="fennel-ls-git"
pkgrel=1
pkgdesc="Language Server for Fennel"
pkgver=0.1.3.r109.g3eb016a
arch=("any")
url="https://git.sr.ht/~xerool/fennel-ls"
license=("MIT")
depends=("lua")
makedepends=("git" "pandoc")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url")
b2sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 | sed 's/-/.r/;s/-/./'
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	make install PREFIX=/usr DESTDIR="$pkgdir"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
