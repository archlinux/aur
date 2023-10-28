# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pseudo
pkgname=$_pkgname-git
pkgver=r420.f9f1278
pkgrel=1
pkgdesc="an analogue to sudo"
arch=(i686 x86_64 arm aarch64)
url=https://git.yoctoproject.org/$_pkgname
depends=(sqlite)
license=(LGPL)
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$_pkgname" || return 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname" || return 1

	./configure --bits=64 --prefix=/usr
}

package() {
	cd "$_pkgname" || return 1

	make DESTDIR="$pkgdir" LIBDIR=/usr/lib install
	install -Dm644 "$srcdir/$_pkgname"/*.1 -t "$pkgdir/usr/share/man/man1"
}
