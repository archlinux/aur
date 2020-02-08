# Maintainer: Julian Hurst <julian.hurst@pm.me>
pkgname=il-git
pkgver=0.1.0.r8.g0f1934f
pkgrel=1
pkgdesc="Interactive List"
arch=('x86_64')
url="https://git.sr.ht/~ark/il"
license=('MIT')
conflicts=(il)
makedepends=(git crystal scdoc)
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	(   
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${pkgname%-git}"
	make PREFIX=/usr
}

package() {
	cd "${pkgname%-git}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
