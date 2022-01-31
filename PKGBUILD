# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>

pkgname=python-agnpy
pkgver=0.1.7
pkgrel=1
pkgdesc="Models Active Galactic Nuclei radiative processes"
arch=('any')
url="https://github.com/cosimonigro/agnpy"
license=('BSD')
depends=('python-astropy' 'python-numpy' 'python-matplotlib' 'python-scipy')
makedepends=('python-build' 'python-install' 'python-wheel' 'python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/a/agnpy/agnpy-$pkgver.tar.gz")
sha256sums=('7e70af095a46874cdb86ee1364262bcb58094e4e47bef21cbd91e07ad7d467a7')

build() {
	cd "agnpy-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
	# python setup.py build
}

# check() {
# 	cd "agnpy-$pkgver"
# 	pytest -x
# }

package() {
	export PYTHONHASHSEED=0
	cd "agnpy-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	# python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
