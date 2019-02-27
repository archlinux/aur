# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=arpc
pkgver=0.8
pkgrel=1
pkgdesc="GRPC-like RPC library that supports file descriptor passing by using Argdata "
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/arpc'
license=('BSD')
depends=('argdata')
makedepends=('cmake' 'python-pypeg2' 'python-toposort')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('5a3eb1a570d8192a046d571a2d078a0f4ec3322e668499a05b4a02aa2cb2a3a04d8860863b4bf94c963978eec026d0d79d8ae86dc0ed3617e34c0c0f826881a9')

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
