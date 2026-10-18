# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-javaobj-py3
_name=python-javaobj
pkgver=0.6.1
pkgrel=1
pkgdesc="Module for reading and writing serialized java objects"
url="https://github.com/tcalmant/python-javaobj"
depends=('python')
checkdepends=('python-pytest')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-numpy: use numpy for loading arrays of primitive types')
license=('Apache-2.0')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tcalmant/${_name}/archive/${pkgver}.tar.gz")

sha256sums=('bc7d4acf389f4ead293e2b42f9244f729050f7ffba42126c572e74b0dc6cc981')

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    # maven is only used to regenerate test fixtures. not required for running the tests.
    JAVAOBJ_NO_MAVEN=1 python -m pytest -q
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}"/${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
