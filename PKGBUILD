# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-py-pol
_pkg=py-pol
pkgver=1.3.0
pkgrel=1
pkgdesc="Python library for Jones and Stokes-Mueller polarization optics"
arch=('any')
url='https://bitbucket.org/optbrea/py_pol'
license=('MIT')
depends=('python-numpy' 'python-scipy' 'python-matplotlib' 'python-plotly' 'python-sympy')
makedepends=('python-pytest-runner' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkg::1}/$_pkg/${_pkg/-/_}-$pkgver.tar.gz")
sha256sums=('1a951d843052c2d19563662b7e239106d3fc01243ddd37299c5a1818e6c900f6')

build() {
    cd "${_pkg/-/_}-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkg/-/_}-$pkgver"
}

package() {
    cd "${_pkg/-/_}-$pkgver"
    python -m installer --destdir="$pkgdir/" dist/*.whl
    local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/${_pkg/-/_}-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
