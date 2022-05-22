# Maintainer: Fabian Klötzl <fabian-aur@kloetzl.info>
pkgname=libdna
pkgver=1.2
pkgrel=1
pkgdesc="Essential Functions for DNA Manipulation"
url="https://github.com/kloetzl/libdna/"
license=("MIT")
depends=()
arch=("i686" "x86_64")
makedepends=("meson")
checkdepends=()
source=("https://github.com/kloetzl/libdna/archive/refs/tags/v1.2.tar.gz")
md5sums=('53c43a314228272a476d31693b686a8c')

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
