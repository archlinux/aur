# Maintainer: sum01 <sum01@protonmail.com>
_pkgname='xmos_dfu'
pkgname="$_pkgname-git"
pkgver=r63.51ef375
pkgrel=1
pkgdesc='CLI DFU utility for XMOS based JDS Labs USB Devices'
arch=('x86_64')
url='https://github.com/jdslabs/xmos_dfu'
license=('LicenseRef-Modified-MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
makedepends=('git')
source=("$_pkgname::git+https://github.com/jdslabs/xmos_dfu.git")
sha512sums=('SKIP')
pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
	cd "$srcdir/$_pkgname/$_pkgname"
	make linux
}
package() {
	cd "$srcdir/$_pkgname"
	install -Dm755 "$_pkgname/xmosdfu" "$pkgdir/usr/bin/xmosdfu"
	install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 'README.md' "$pkgdir/usr/share/doc/$pkgname/README.md"
}
