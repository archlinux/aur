# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

_base=okular-backend-mupdf
pkgname=("$_base-git")
pkgver=r54.8a03617
pkgrel=1
pkgdesc="MuPDF-based backend for Okular (git version)"
arch=('i686' 'x86_64')
license=('GPL')
depends=('okular' 'openjpeg2' 'mupdf')
makedepends=('gcc' 'automoc4' 'cmake' 'git' 'libmupdf')
url="https://github.com/xyzz/okular-backend-mupdf"
source=("git+$url")
sha1sums=('SKIP')
conflicts=("$_base")
provides=("$_base")

pkgver() {
	cd "$_base"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $srcdir/$_base
	rm -rf build
	mkdir build && cd build
	cmake -DCMAKE_INSTALL_PREFIX:PATH=$pkgdir/usr -DCMAKE_INSTALL_LIBDIR=$pkgdir/usr/lib/qt .. && make -j$(nproc)
}

package() {
	cd $srcdir/$_base/build
	make install
}
