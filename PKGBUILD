# Maintainer: Maarten de Vries <maarten@de-vri.es>
# Contributor:  Maarten de Vries <maarten@de-vri.es>

pkgname=flower
pkgver=0.11
pkgrel=1
pkgdesc="label-based networking daemon"
arch=('x86_64' 'aarch64')
url='https://github.com/NuxiNL/flower'
license=('BSD')
depends=('arpc' 'argdata' 'jsoncpp')
makedepends=('cmake' 'python-pypeg2' 'python-toposort')

source=("$pkgname-$pkgver.tar.gz::https://github.com/NuxiNL/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('764ed8606181227ff6443393a63840832705454dd32e8dbdd6920da7a72c5d8419bd1ffe0ea84185502df330940e3e96b105f0c4a9f880275fe9190e38cea6cb')

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
