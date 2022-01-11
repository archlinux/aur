# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-quicktions
pkgver=1.13
pkgrel=1
pkgdesc="Fast fractions implementation in Cython"
arch=('x86_64')
url="https://github.com/scoder/quicktions"
license=('Python')
depends=('glibc')
makedepends=('python-setuptools' 'cython')
# checkdepends=('python-pytest')
changelog=CHANGES.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('4dfbe8dee81099deb28059aeeed72e7b47e22c4204be4ad52aef501b49bd21e7')

build() {
	cd "quicktions-$pkgver"
	make
}

## tests segfault
# check() {
# 	cd "quicktions-$pkgver"
# 	make test
# }

package() {
	export PYTHONHASHSEED=0
	cd "quicktions-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
