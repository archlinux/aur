# Maintainer: Kian Kasad <kian at kasad.com>
pkgname=bgs-kian-git
pkgver=v0.9
pkgrel=1
pkgdesc="a suckless background setter for X"
arch=(any)
url="https://git.kasad.com/bgs.git"
license=('MIT')
depends=(imlib2 libx11 libxinerama)
makedepends=('git')
provides=("${pkgname%-kian-git}")
conflicts=("${pkgname%-kian-git}")
source=('git+https://git.kasad.com/bgs.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-kian-git}"

	# print version using latest tag/commit
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-kian-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-kian-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
