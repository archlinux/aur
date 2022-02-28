# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## python-numba requires python-numpy>1.21; ver 0.56 should fix this

pkgname=python-chemicals
pkgver=1.0.17
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=('any')
url="https://github.com/calebbell/chemicals"
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-pandas' 'python-fluids')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'python-pytest'
# 	'python-sympy'
# 	'python-matplotlib'
# 	'python-pint'
# 	'ipython'
# 	'python-mpmath'
# 	'python-fuzzywuzzy'
# 	'python-pytz'
# 	'python-numba')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/chemicals/chemicals-$pkgver.tar.gz")
sha256sums=('5ca049e432c80ec30835612f4a6cac34bc065f15c1d874945b5bdc2f788f4261')

build() {
	cd "chemicals-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "chemicals-$pkgver"
# 	pytest -x -k 'not slow or not online or not thermo'
# }

package() {
	export PYTHONHASHSEED=0
	cd "chemicals-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
