# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=pseudo
pkgname=$_pkgname-git
pkgver=0.0.1
pkgrel=1
pkgdesc=""
arch=(any)
url=https://github.com/Freed-Wu/$_pkgname
license=(GPL3)
makedepends=(git)
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

	make DESTDIR="$pkgdir" install
}
