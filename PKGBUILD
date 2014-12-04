# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=1.0.0
pkgrel=1
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://crate.io/packages/pyuv/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
source=("https://github.com/saghul/pyuv/archive/$_libname-$pkgver.tar.gz"
        system-libuv.patch)

prepare() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	patch -p1 -i "$srcdir"/system-libuv.patch
}

build() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$_libname-$pkgver
	python setup.py install --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('0994dede693ab0424244d18f173d236787fc8efcaff2d2b0b79d1dc92f205b15'
            'ab6e8a6c73029b1867aef58848edd11250a50a827f37608c3b6b275b636b8c15')
