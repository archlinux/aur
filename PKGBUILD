# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python-evdev
pkgver=0.6.4
pkgrel=2
_libname=${pkgname/python-/}
pkgdesc="Python bindings for the linux input handling subsystem"
url="http://python-evdev.readthedocs.org/en/latest/"
depends=(python linux-api-headers)
makedepends=('python-setuptools')
license=('BSD')
arch=('i686' 'x86_64')
source=(https://files.pythonhosted.org/packages/source/e/$_libname/$_libname-$pkgver.tar.gz
        $pkgname-$pkgver-LICENSE::https://github.com/gvalkov/python-evdev/raw/v$pkgver/LICENSE)
sha256sums=('5268744d8493c273614036cf6423fa175952c64fc1d8d265210e48a4437a6af2'
            '062e7b255501e598ba040b507e077f51c8c91734c21520920f70eeb5c5280ae6')

build() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py build
}

package() {
	cd "$srcdir"/$_libname-$pkgver
	python setup.py install --skip-build -O1 --root="$pkgdir"

	cd "$pkgdir"
	install -m0644 -D "$srcdir"/$pkgname-$pkgver-LICENSE usr/share/licenses/$pkgname/LICENSE
	chmod -R a+r usr
}
