# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-unyt
_module_name=unyt
pkgver=3.0.1
pkgrel=2
pkgdesc="A package for handling numpy arrays with units."
arch=(any)
url="https://pypi.org/project/unyt/"
license=('BSD')
depends=('python-numpy' 'python-sympy')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel' 'python-packaging' 'python-setuptools')
checkdepends=('python-pytest')
options=(!emptydirs)
source=("https://pypi.io/packages/source/u/${_module_name}/${_module_name}-${pkgver}.tar.gz")
sha256sums=('8860efe960afadddebc8c0c2624336a9c64241a73dddfef863af6722f8022001')

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
