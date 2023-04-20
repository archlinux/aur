# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-traittypes'
_module='traittypes'
pkgver='0.2.1'
pkgrel=3
pkgdesc="Traitlet types for NumPy, SciPy and friends."
url="https://github.com/jupyter-widgets/traittypes"
depends=('python'
    'python-traitlets'
    'python-numpy'
    'python-pandas')
checkdepends=('python-pytest' 'python-xarray')
makedepends=('git' 'python-setuptools')
license=('BSD')
arch=('any')
source=("git+https://github.com/jupyter-widgets/traittypes.git#commit=af2ebeec9e58b73a12d4cf841bd506d6eadb8868")
sha256sums=('SKIP')

build() {
    cd "${_module}"
    python setup.py build
}

package() {
    cd "${_module}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
    cd "${_module}"
    sed -i -e "s/np.int/int/" traittypes/tests/test_traittypes.py
    PYTHONPATH=. pytest
}
