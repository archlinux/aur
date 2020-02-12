# Maintainer: Julian Hurst <julian.hurst@pm.me>
pkgname=il-git
pkgver=0.1.0.r26.ga1c1399
pkgrel=1
pkgdesc="Interactive List"
arch=('x86_64')
url="https://git.sr.ht/~ark/il"
license=('MIT')
conflicts=(il)
makedepends=(git crystal shards scdoc)
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
