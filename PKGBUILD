# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
pkgname=lamb-git
_pkgname=${pkgname%-git}
pkgver=r68.b5f6c02
pkgrel=2
pkgdesc="Tiny Pure Functional Programming Language in C"
arch=('x86_64')
url="https://github.com/tsoding/lamb"
license=('MIT')
depends=('glibc')
makedepends=('git' 'gcc')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/tsoding/lamb.git')
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"

	gcc $CFLAGS $LDFLAGS -o lamb lamb.c
}

package() {
	cd "$_pkgname"

	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/lamb"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
