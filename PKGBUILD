# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=flower
pkgver=0.10
pkgrel=2
pkgdesc="label-based networking daemon"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/flower'
license=('BSD')
depends=('arpc' 'argdata' 'jsoncpp')
makedepends=('cmake' 'python-pypeg2' 'python-toposort')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('32d817857fed98fb1c0364f315a9b7adbff840db281854f9aa43a379e0c803974f7daad5f668c4f3f389693ef35c0e36916795d902fdef2134d137d364b8d22d')

_dir="$pkgname-$pkgver"
prepare() {
	rm -rf "$srcdir/build"
	mkdir -p "$srcdir/build"
	cd "$srcdir/build"

	cmake "$srcdir/$_dir" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib
}

build() {
	cd "$srcdir/build"
	make
}

package() {
	cd "$srcdir/build"
	make install DESTDIR="$pkgdir"
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_dir/LICENSE"
}
