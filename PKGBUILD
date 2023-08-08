# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver='5.1'
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels/doc"
depends=('python-formulaic'
    'python-numpy'
    'python-pandas'
    'python-property-cached'
    'python-pyhdfe'
    'python-scipy'
    'python-statsmodels')
checkdepends=('python-mypy_extensions' 'python-pytest' 'python-xarray')
optdepends=('python-xarray')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('1a157a974a346a78b9a3e42b86e5a624b052c4269b0441f56deac57f75cf95c5')

build() {
    cd "${_module}-${pkgver}"
    python -m build --wheel --no-isolation
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
