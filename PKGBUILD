# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-dymos
pkgver=1.5.0
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
sha256sums=('e9e8b17967ae31efa96f896d1212a850de42edcf49264aac6460fcd6ffdac715')

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
	PYTHONPATH="$PWD" pytest -x --disable-warnings
}

package() {
	cd "dymos-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
