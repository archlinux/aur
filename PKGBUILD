# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fluids
pkgver=1.0.17
pkgrel=1
pkgdesc="Fluid dynamics component of Chemical Engineering Design Library"
arch=('any')
url="https://github.com/calebbell/fluids"
license=('MIT')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'python-pytest'
# 	'python-pint'
# 	'python-pytz'
# 	'python-pandas'
# 	'python-numba')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/fluids/fluids-$pkgver.tar.gz")
sha256sums=('4bfe176256d8c8ce3038c802574e0d1931bff93a912ab6998d51210b138cf8dd')

build() {
	cd "fluids-$pkgver"
	python -m build --wheel --no-isolation
}

# check() {
# 	cd "fluids-$pkgver"
# 	pytest -x -k 'not slow or not online or not thermo'
# }

package() {
	export PYTHONHASHSEED=0
	cd "fluids-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
