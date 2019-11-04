# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=('python-traittypes')
_module='traittypes'
pkgver='0.2.1'
pkgrel=1
pkgdesc="Traitlet types for NumPy, SciPy and friends."
url="https://github.com/jupyter-widgets/traittypes"
depends=('python'
    'python-traitlets'
    'python-numpy'
    'python-pandas')
checkdepends=('python-pytest' 'python-xarray')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://github.com/jupyter-widgets/traittypes/archive/${pkgver}.tar.gz")
sha256sums=('f498c418d04551ea3b21fd97d1f3dcfbc114a672231580bb4e044a188f46efeb')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m unittest
}
