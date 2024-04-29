# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver='6.0'
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels/doc"
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
sha256sums=('3420108ba172bae6f433264fcda2c73ee1da750f7c7057722c370e41b0637ff1')

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
