# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver='7.0'
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels"
depends=('python-formulaic'
    'python-numpy'
    'python-pandas'
    'python-pyhdfe'
    'python-scipy'
    'python-statsmodels')
checkdepends=('python-mypy_extensions' 'python-pytest' 'python-xarray')
optdepends=('python-xarray')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('15b50271068d8ad7ef58924fea6ca3fced055f8439f9e17d2ce62ba91c64ed24')

build() {
    cd "${_module}-${pkgver}"
    python -m build -x --wheel --no-isolation
}

package() {
    cd "${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_module}-${pkgver}"
    pytest linearmodels --skip-slow
}
