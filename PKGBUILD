# Maintainer: Lennard Hofmann <lennard dot hofmann at web dot de>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=sage-numerical-backends-gurobi
pkgver=10.4
pkgrel=1
pkgdesc='Gurobi mixed integer linear programming backend for SageMath'
arch=(x86_64)
url='https://github.com/mkoeppe/sage-numerical-backends-gurobi'
license=(GPL-2.0-or-later)
depends=(sagemath gurobi python-cysignals)
makedepends=(cython python-build python-installer python-wheel python-setuptools)
source=(https://github.com/mkoeppe/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('05b2a6187ceeff6b91ae299a9651767b154ef2dbdc9805b3e766a6fda205b4e5')

package() {
	cd $_name-$pkgver
}

build() {
	cd $pkgname-$pkgver
	# Uncomment this if you have installed gurobi into /usr:
	# export GUROBI_HOME=/usr

	# pyproject.toml specifies sagemath-environment and sagemath-categories as dependencies
	# but it suffices to have the sagemath package installed; hence: `--skip-dependency-check`
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd $pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
