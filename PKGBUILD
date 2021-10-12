# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: M. Jarvis

pkgname=python-coord
pkgver=1.2.2
pkgrel=2
pkgdesc="Python module for handling angle and celestial coordinates"
arch=('x86_64')
url="https://github.com/LSSTDESC/Coord"
license=('BSD')
depends=('libffi' 'python-cffi' 'python-future' 'python-numpy')
makedepends=('python-setuptools' 'python-sphinx')
checkdepends=('python-nose' 'python-astropy')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('62578e1bbbce1319435ab70013e45f5e83e323220cdb9e5e01aca19d9c0559bd')

build() {
	cd "Coord-$pkgver"
	python setup.py build
	cd docs
	PYTHONPATH=../ make man
}

check() {
	cd "Coord-$pkgver"
	nosetests
}

package() {
	cd "Coord-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 docs/_build/man/coord.1 -t "$pkgdir/usr/share/man/man1/"
}
