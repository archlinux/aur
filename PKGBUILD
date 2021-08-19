# Maintainer: Kian Kasad <kian@kasad.com>
pkgname=rconc-git
pkgver=0.2.3.r5.72822ab
pkgrel=1
pkgdesc="a simple RCON client"
arch=('any')
url="https://git.kasad.com/rconc"
license=('GPL2')
depends=('readline')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//; s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
