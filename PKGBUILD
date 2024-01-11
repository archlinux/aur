# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-pyuv
pkgver=1.4.0
pkgrel=2
_libname=${pkgname/python-/}
pkgdesc="A Python module which provides an interface to libuv."
url="https://pyuv.readthedocs.io/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('python' 'libuv')
source=("https://github.com/saghul/pyuv/archive/$_libname-$pkgver.tar.gz" "py11.patch")

prepare() {
	cd $_libname-$_libname-$pkgver
	patch -p1 -i ../py11.patch
}

build() {
	cd $_libname-$_libname-$pkgver
	python setup.py build_ext --use-system-libuv
}

package() {
	cd $_libname-$_libname-$pkgver
	python setup.py install --skip-build --root="$pkgdir"
	install -m0644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('922e1dd4c05085bc6257b8f254e5e8bc232647fc757d371002abe31a1ce31b07'
            '8423fb663235aa6b6c14065760bc569a1193400553b8e67bd7411a5c462c97f4')
