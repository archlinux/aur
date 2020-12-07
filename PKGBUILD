# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver='0.25.0'
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/ParallelSSH/ssh2-python/"
depends=('libssh2')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('GPL')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ParallelSSH/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('2fad2e2149ff14f17e1c2e18993624aa573f0ead8db4cb9491e0671448ccb677')

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
