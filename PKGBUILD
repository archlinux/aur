# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver='4.31'
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
makedepends=('cython' 'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_module::1}/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('78a00ebd0360c2886357e8197faca174dc4521256a01e9f24114054bca676be9')

build() {
    cd "${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}

check() {
    cd "${_module}-${pkgver}"
    pytest linearmodels --skip-slow
}
