#Maintainer: Torsten Keßler <t dot kessler at posteo dot de>
_pkgname=pcg-c
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc='C implementation of a fast, statistically excellent family of random number generators'
arch=('x86_64')
url='http://www.pcg-random.org/'
license=('Apache' 'MIT')
makedepends=('git')
source=("git+https://github.com/imneme/$_pkgname.git")
sha256sums=('SKIP')
provides=("$_pkgname")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C "$_pkgname"
}

check() {
	make -C "$_pkgname" test
}

package() {
	cd "$_pkgname"
	install -Dm644 "src/libpcg_random.a" "$pkgdir/usr/lib/libpcg_random.a"
	install -Dm644 "include/pcg_variants.h" "$pkgdir/usr/include/pcg_variants.h"
	install -Dm644 "LICENSE-MIT.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" 
}
