# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=3.0.2
pkgrel=1
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-packaging' 'python-setuptools')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://pypi.io/packages/source/u/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('f3b3d6665d1af4ff9be846ec932a61824fe20b2f5d0c06cf372a288f59894b73')

build() {
    cd "${srcdir}/${_module_name}-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module_name}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

check() {
    cd "${srcdir}/${_module_name}-$pkgver"
    pytest
}
