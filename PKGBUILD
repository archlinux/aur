# Maintainer: Marcus Hoffmann <bubu@bubu1.eu>

pkgname=python-pyjks
_name=pyjks
pkgver=20.0.0
pkgrel=1
pkgdesc="library to load and manipulate java keystores (jks)"
url="https://pypi.org/project/${_name}/"
depends=('python' 'python-pyasn1' 'python-pyasn1-modules' 'python-javaobj-py3' 'python-pycryptodomex' 'python-twofish')
checkdepends=('python-py' 'python-pytest')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kurtbrose/${_name}/archive/v${pkgver}.tar.gz")

sha256sums=('e015b607e406421768abc5fe9b068959aad477b11b3f48a2d53294f895e317bb')

check() {
    cd "${srcdir}"/${_name}-${pkgver}
    PYTHONPATH=build/lib python -m tests.test_jks
}

build() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd "${srcdir}"/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
