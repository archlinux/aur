# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Martin Diehl <https://martin-diehl.net>

pkgname=python-chaospy
pkgver=4.3.3
pkgrel=1
pkgdesc="Toolbox for performing uncertainty quantification"
arch=('any')
url="https://github.com/jonathf/chaospy"
license=('BSD')
depends=('python-numpoly>=1.1.2' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'python-dephell')
checkdepends=('python-pytest' 'python-scikit-learn')
changelog=CHANGELOG.rst
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c258aa2abb42e4914aa401a954aa840bd194229737b522b5d409486a7f6917d8')

prepare() {
	cd "chaospy-$pkgver"
	dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd "chaospy-$pkgver"
	python setup.py build
}

check() {
	cd "chaospy-$pkgver"
	pytest
}

package() {
	cd "chaospy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
