# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=labwc-menu-generator-git
pkgdesc='Desktop-independent menu generator for OpenBox/labwc'
url=https://github.com/labwc/labwc-menu-generator
pkgver=r7.d7c8107
pkgrel=1
arch=(x86_64)
makedepends=(git perl)
depends=(glib2)
license=(GPL2)
provides=(labwc-menu-generator)
conflicts=(labwc-menu-generator)
source=("$pkgname::git+$url")
b2sums=(SKIP)

pkgver () {
	cd "$pkgname"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build () {
	make -C "$pkgname"
}

check () {
	make -C "$pkgname" check
}

package () {
	install -Dm755 "$pkgname/labwc-menu-generator" "$pkgdir/usr/bin/labwc-menu-generator"
}
