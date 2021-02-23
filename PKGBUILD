# Maintainer: qs9rx <qs9rx.aur@enjoys.it>
pkgname=untwine-git
pkgver=r74.48ee6f7
pkgrel=1
pkgdesc="Untwine is software to create Entwine Point Tile (EPT) web services from PDAL-readable point cloud data sources."
arch=("x86_64")
url="https://github.com/hobu/untwine"
license=('GPL')
depends=('pdal')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/hobu/untwine")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	mkdir build
	cd build
	cmake ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	install -Dm755 "untwine" "${pkgdir}/usr/bin/untwine"
}
