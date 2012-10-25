# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-pyuv
pkgver=0.8.3
pkgrel=1
_libname=${pkgname/python2-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python2')
makedepends=('libuv')
source=("http://pypi.python.org/packages/source/p/$_libname/$_libname-$pkgver.tar.gz")

build() {
	cd "$srcdir/$_libname-$pkgver"

	rm -f "deps/libuv/libuv.a"
	ln -s /usr/lib/libuv.a "deps/libuv/"
	python2 setup.py build_ext --inplace --force
}

package() {
	cd "$srcdir/$_libname-$pkgver"
	python2 setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('5eb8104d16bfd1fab0c5188866fc15db3cb170c0aa372261a27d8b442ac7c43d')
