# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=0.9.7
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

sha256sums=('e882d5c5a27bee82754f12ae92105f642689aa5e1fcf84ce49507e9e95e7926b')
