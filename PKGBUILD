# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-javaobj-py3
_name=python-javaobj
pkgver=0.4.3
pkgrel=2
pkgdesc="Module for reading and writing serialized java objects"
url="https://pypi.org/project/javaobj-py3/"
depends=('python')
checkdepends=('maven')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optepends=('python-numpy: use numpy for loading arrays of primitive types')
license=('Apache')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tcalmant/${_name}/archive/${pkgver}.tar.gz")

sha256sums=('49c1a55228d7709f2c537e6684ebd1a3f8faf25d2fe6979104054f0e811bf452')

check() {
    local _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    cd "${srcdir}"/${_name}-${pkgver}
    python -m installer --destdir=test_dir dist/*.whl
    export PYTHONPATH="test_dir/$_site_packages:$PYTHONPATH"
    python -vv -m tests.tests
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
