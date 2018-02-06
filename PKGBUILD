# Maintainer: Maarten de Vries <maarten@de-vri.es>
pkgname=grasp-pose-generator
pkgdesc="Generate grasp pose candidates in point clouds "
url="https://github.com/atenpas/gpg"
pkgver=0.0.0.b4f1fee
pkgrel=2
depends=(pcl eigen)
arch=(x86_64)
license=(BSD)

_commit=b4f1fee23e36e53a10b71fb80d3e0da157a52bea
source=("$pkgname-$_commit.tar.gz::https://github.com/atenpas/gpg/archive/$_commit.tar.gz")
sha512sums=('2d33a7c53c3cba133fd142face9daf4c0eb77e4d19ef4e3cd3e0c68b83b687a1ffa0c5d259636abd8b0c765cee72d46ba3337520740a6f2a0c4b7e461e77be84')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/gpg-$_commit" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/gpg-$_commit/LICENSE"
}
