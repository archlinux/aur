# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

## python-numba requires python-numpy>1.21; ver 0.56 should fix this

pkgname=python-chemicals
_pkg="${pkgname#python-}"
pkgver=1.0.21
pkgrel=1
pkgdesc="Chemical database of Chemical Engineering Design Library"
arch=('any')
url="https://github.com/calebbell/chemicals"
license=('MIT')
depends=('python-fluids' 'python-numpy' 'python-pandas' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'ipython'
# 	'python-fuzzywuzzy'
# 	'python-matplotlib'
# 	'python-mpmath'
# 	'python-numba'
# 	'python-pint'
# 	'python-pytest'
# 	'python-pytz'
# 	'python-sympy')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/c/chemicals/chemicals-$pkgver.tar.gz")
sha256sums=('59f4ae1e6093f12a3f570458456d587f88ad27278f4abc39781ef0c035653314')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "$_pkg-$pkgver"
# 	pytest -x -k 'not slow or not online or not thermo'
# }

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dvm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
