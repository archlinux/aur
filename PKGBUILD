# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libdna
pkgver=1.3
pkgrel=1
pkgdesc="Essential Functions for DNA Manipulation"
url="https://github.com/kloetzl/libdna/"
license=("MIT")
depends=()
arch=("i686" "x86_64")
makedepends=("meson")
checkdepends=()
source=("https://github.com/kloetzl/libdna/archive/refs/tags/v1.3.tar.gz")
sha256sums=('f9170d360e3d40d3f6ba1a3e2ce4822662cb8c6e4392397f8bb8a4a0e9529694')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson --prefix=/usr builddir
	cd builddir
	meson compile
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd "rttest"
	make PREFIX="${srcdir}/usr/" CPPFLAGS="-I${srcdir}/${pkgname}-${pkgver}/include/ -I${srcdir}/${pkgname}-${pkgver}/include/kloetzl" CFLAGS="-L${srcdir}/${pkgname}-${pkgver}/builddir -ldna" all
	make LD_LIBRARY_PATH="${srcdir}/${pkgname}-${pkgver}/builddir" check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cd builddir
	meson install --destdir "${pkgdir}"
}
