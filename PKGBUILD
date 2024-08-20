# Maintainer: Kyrill Belomenov <apfel236@outlook.de>
pkgname="rhp-git"
pkgver=r47.c23cd9f
pkgrel=1
pkgdesc="An rusherhack plugin manager"
arch=('x86_64')
url="https://github.com/kybe236/rhp"
license=('MIT')
makedepends=('git' 'zig')
source=('git+https://github.com/kybe236/rhp.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/rhp"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/rhp"
	zig build -Doptimize=ReleaseFast
}

package() {
	cd "$srcdir/rhp"
	
	install -Dm755 "zig-out/bin/rhp" "$pkgdir/usr/bin/rhp"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
