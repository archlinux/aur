# Maintainer: shtrophic <aur at shtrophic dot net>

_pkgname=bass
pkgname="fish-$_pkgname-git"
pkgver=1.0.r49.g79b6295
pkgrel=1
pkgdesc="Make Bash utilities usable in Fish shell"
arch=(any)
url="https://github.com/edc/bass"
license=(MIT)
depends=(fish python)
makedepends=(git)
provides=("fish-$_pkgname")
source=("git+$url.git")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

check() {
	cd "$srcdir/$_pkgname"
	make test
}

package() {
	cd "$srcdir/$_pkgname"

	mkdir -p "$pkgdir/usr/share/fish/vendor_functions.d"
	install -m 644 functions/__bass.py "$pkgdir/usr/share/fish/vendor_functions.d"
	install -m 644 functions/bass.fish "$pkgdir/usr/share/fish/vendor_functions.d"
}

