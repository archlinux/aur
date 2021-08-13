# Maintainer: Eric Langlois <eric@langlois.xyz>
pkgname=python-dowel
_name=${pkgname#python-}
pkgver=0.0.4
pkgrel=1
pkgdesc="A logger for machine learning research"
arch=('any')
url="https://github.com/rlworkgroup/dowel"
license=('MIT')
depends=(
	'python-dateutil'
	'python-matplotlib'
	'python-numpy'
	'python-scipy'
	'python-tabulate'
	'python-tensorboardx'
)
optdepends=(
	'tensorboard: Output to tensorboard'
)
makedepends=('python-setuptools')
checkdepends=(
	'python-pytest'
	'python-pytest-cov'
	'python-pytest-xdist'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('832a6d06936d43101fc6f53d767db48612164e08a6e679da32b28f3898de638e')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver/build/lib"
	python -m pytest "$srcdir/$_name-$pkgver/tests" \
		--ignore "$srcdir/$_name-$pkgver/tests/$_name/test_tensor_board_output.py"
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
