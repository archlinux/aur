# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pyuv
pkgver=0.10.3
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('libuv')
source=("$_libname-$pkgver.tar.gz::https://github.com/saghul/pyuv/archive/release-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-release-$pkgver"

	rm -f "deps/libuv/libuv.a"
	mkdir -p deps/libuv
	ln -s /usr/lib/libuv.a deps/libuv/
	ln -s /usr/include/libuv deps/libuv/include
	python2 setup.py build_ext --inplace --force
}

package() {
	cd "$srcdir/$_libname-release-$pkgver"
	python2 setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('f464558e0851b3f09c1632461d4c79941c1e1f8994db7200900c627e4b7f46a8')
