# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=0.9.5
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('libuv')
source=("$_libname-$pkgver.tar.gz::https://github.com/saghul/pyuv/archive/release-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-release-$pkgver"

	rm -f "deps/libuv/libuv.a"
	mkdir -p deps/libuv
	ln -s /usr/lib/libuv.a deps/libuv/
	ln -s /usr/include/libuv deps/libuv/include
	python setup.py build_ext --inplace --force
}

package() {
	cd "$srcdir/$_libname-release-$pkgver"
	python setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('c691265b882372471b8c0ed4374ff86767e5cdbfc2de529786a383a2821c0aa9')
