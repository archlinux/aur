# Maintainer: Josh Wright <wright.jjw@gmail.com>
pkgname=tsgl-git
pkgver=r1281.ec8a3f6
pkgrel=2
pkgdesc="Thread Safe Graphics Library"
arch=(x86_64)
url="https://github.com/Calvin-CS/TSGL"
license=('GPL')
depends=(glew glfw glm freetype2 doxygen)
makedepends=(git)       # packages in base-devel (make and gcc) are assumed to be installed
                        # (https://wiki.archlinux.org/index.php/PKGBUILD#makedepends)
optdepends=()
provides=(tsgl)
conflicts=(tsgl)
source=("git+$url"
        "Makefile.patch")
md5sums=("SKIP"
         "bce2f0c5bc27b4e2a076829e0c96da57")

# Patch corrects creating lib dirs so package can be built locally
prepare() {
    cd "TSGL"
    patch Makefile "$srcdir/Makefile.patch"
}

pkgver() {
    cd "TSGL"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "TSGL"
    make
}

package() {
	cd "TSGL"
	make PREFIX="$pkgdir/usr" install
}
