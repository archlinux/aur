# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-py-pol
_pkg=py-pol
pkgver=1.1.0
pkgrel=1
pkgdesc="Python library for Jones and Stokes-Mueller polarization optics"
arch=('any')
url='https://bitbucket.org/optbrea/py_pol'
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-plotly' 'python-sympy')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-pytest-runner')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/${_pkg/-/_}-$pkgver.tar.gz")
sha256sums=('b8dae0c47156dd0ad58cf996ba728b0c82492495bfa14fb523bd02fa576c4ca9')

build() {
	cd "${_pkg/-/_}-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "${_pkg/-/_}-$pkgver"
}

package() {
	cd "${_pkg/-/_}-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
