# Maintainer: Jaël Champagne Gareau <gareau_jael@hotmail.com>
# Contributor: Pierre Marsais <pim@lse.epita.fr>
pkgname=man-intrinsics-git
pkgver=r73.1ecedba
pkgrel=1
pkgdesc="man pages from Intel Intrinsics Guide"
url="https://github.com/WojciechMula/man-intrinsics"
license=('unknown')
arch=('x86_64')
makedepends=('git' 'curl' 'python')
source=('git+https://github.com/jaja360/man-intrinsics.git#branch=fix-uops.info-format')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make download
}

package() {
	cd "$srcdir/${pkgname%-git}"
	mkdir -p "$pkgdir/usr/share/man/man7"
	python ./main.py -g data-latest.xml -u instructions.xml -o "$pkgdir/usr/share/man/man7"
}
