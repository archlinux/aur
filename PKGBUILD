# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver='0.23.0'
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/ParallelSSH/ssh2-python/"
depends=('python' 'libssh2')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('GPL')
arch=('x86_64')
source=("https://github.com/ParallelSSH/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('70ff84e6ce37df877ce239109b713fb0f5b26de6309c72da5fa41723863ab14b')

build() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext
}

package() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py install --root="${pkgdir}" --optimize=1
}

check() {
    cd "${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext --inplace
    pytest tests
}
