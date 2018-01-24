# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=arpc
pkgver=0.7
pkgrel=2
pkgdesc="GRPC-like RPC library that supports file descriptor passing by using Argdata "
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/arpc'
license=('BSD')
depends=('argdata')
makedepends=('cmake' 'python-pypeg2' 'python-toposort')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('4067108f03c2f2ede3ee6caa65b6ee2780b868d84e5344817dbf545a70007931fca5e8fd1cebd9c0e1f1e7872128b9d868cfac19586be7895f3de86b82a56d81')

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
	install -m 644 -D -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$_dir/CONTRIBUTORS"
}
