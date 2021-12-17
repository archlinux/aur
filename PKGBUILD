# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-linearmodels'
_module='linearmodels'
pkgver='4.25'
pkgrel=1
pkgdesc="Linear models in Python."
url="https://bashtage.github.io/linearmodels/doc"
depends=('python-formulaic'
    'python-numpy'
    'python-pandas'
    'python-property-cached'
    'python-scipy'
    'python-statsmodels')
checkdepends=('python-mypy_extensions' 'python-pytest' 'python-xarray')
optdepends=('python-xarray')
makedepends=('cython' 'python-setuptools')
license=('custom:University of Illinois/NCSA Open Source License')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bashtage/linearmodels/archive/v${pkgver}.tar.gz")
sha256sums=('7c79b5c941ce6a6bd2e9e58edb3fb0c36aeaedf61c955583345ca0ace66c359e')

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
