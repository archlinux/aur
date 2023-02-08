# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.7.0
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache')
depends=('python-numpy')
makedepends=('python-setuptools' 'pybind11')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4eba5d103a558fc76782d4051cde0cac2361fe5c36ccf56a959f9ff36813c91b')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname#python-}-${pkgver}"
    local _pyver=$(python -c 'import sys; print("%d%d" % sys.version_info[:2])')
    PYTHONPATH=build/lib.linux-x86_64-cpython-$_pyver  python -m unittest discover \
                   --start-directory tests/python --pattern "bindings_test*.py"
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: set ts=4 sw=4 et:
