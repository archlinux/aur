# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver=1.0.0
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/parallel-ssh/ssh2-python/"
depends=('libssh2')
makedepends=('python-setuptools' 'cython')
checkdepends=('openssh' 'python-pytest')
license=('GPL')
arch=('x86_64')
source=("git+https://github.com/parallel-ssh/ssh2-python.git")
sha256sums=('SKIP')

build() {
    cd "${_pkgname}"
    SYSTEM_LIBSSH2=1 python setup.py build
}

package() {
    cd "${_pkgname}"
    SYSTEM_LIBSSH2=1 python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext --inplace
    pytest tests
}
