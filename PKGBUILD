# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: acxz <akashpatel2008@yahoo.com>

pkgname=python-flake8-deprecated
_name="${pkgname#python-}"
pkgver=1.3
pkgrel=2
pkgdesc='Flake8 plugin that warns about deprecated method calls'
arch=('any')
url='https://github.com/gforcada/flake8-deprecated'
license=('GPL2')
depends=('flake8')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2cc9c9da5aad69c65a83b0005d887703f4a2e8d9ec7327c0c5d9b7258988caa8')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	pytest run_tests.py
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm 644 LICENSE.rst -t "$pkgdir/usr/share/licenses/$pkgname/"
}
