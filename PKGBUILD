# Maintainer: a821

pkgname=python-hnswlib
pkgver=0.6.2
pkgrel=1
pkgdesc="Header-only C++/python library for fast approximate nearest neighbors"
url="https://github.com/nmslib/hnswlib"
arch=('x86_64')
license=('Apache')
depends=('python-numpy')
makedepends=('python-setuptools' 'pybind11')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('19899f233f0361e1203a2b7e5143ed284f57c4e1501c8adc19f3bc341edb4100')

build() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py build
}

check() {
    cd "${pkgname#python-}-${pkgver}/python_bindings/tests"
    local _pyver=$(python -c 'import sys; print("%d.%d" % sys.version_info[:2])')
    PYTHONPATH=../../build/lib.linux-x86_64-$_pyver/ python -m unittest discover --pattern "*_test*.py"
}

package() {
    cd "${pkgname#python-}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
# vim: set ts=4 sw=4 et:
