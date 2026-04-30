# Maintainer: Maarten de Vries <maarten@de-vri.es>

pkgname=estd
pkgdesc="Extended C++ library in the style of the standard library"
url="https://github.com/fizyr/estd"
pkgver=0.6.5
pkgrel=1
makedepends=(cmake catch2)
arch=(x86_64)
license=(BSD)

source=("$pkgname-$pkgver.tar.gz::https://github.com/fizyr/estd/archive/$pkgver.tar.gz")
sha512sums=('eaf1df334ca9527660e19dcb829b5613b23cc8427f46c88b81efa827f84bb053329540874031652441f66bc2761abf7172d7bb7b17e1453e126c7e6770a7fcd1')

prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"
	cmake "$srcdir/$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DUSE_CATKIN=OFF \
		-DCMAKE_BUILD_TYPE=Release
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m644 -Dt "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname-$pkgver/LICENSE"
}
