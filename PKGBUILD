# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-fluids
_pkg="${pkgname#python-}"
pkgver=1.0.21
pkgrel=1
pkgdesc="Fluid dynamics component of Chemical Engineering Design Library"
arch=('any')
url="https://github.com/calebbell/fluids"
license=('MIT')
depends=('python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=(
# 	'python-numba'
# 	'python-pandas'
# 	'python-pint'
# 	'python-pytest'
# 	'python-pytz')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/f/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('d65b313c3f681a6f0a2c3c17084d3062c210aa7cfdd4116c18c942d67bb8c100')

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
