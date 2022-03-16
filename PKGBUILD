# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-dymos
pkgver=1.4.0
pkgrel=1
pkgdesc="Open-source optimization of dynamic multidisciplinary systems"
arch=('any')
url="https://github.com/openmdao/dymos"
license=('Apache')
depends=('python-openmdao' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pep8' 'python-testflo' 'python-matplotlib')
optdepends=('ipython' 'python-notebook' 'python-tabulate')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/d/dymos/dymos-$pkgver.tar.gz")
sha256sums=('ebda14a3f857e4fc2ed2a7d5c7c88be1edd8286b1ca92b7288ccf70b83930c2b')

prepare() {
	cd "dymos-$pkgver"
	sed -i "/packages=/s/()/(exclude=['*test*'])/" setup.py
}

build() {
	cd "dymos-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "dymos-$pkgver"
	pytest -x --disable-warnings
}

package() {
	export PYTHONHASHSEED=0
	cd "dymos-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
