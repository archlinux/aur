# Maintainer: Jan Cholasta <grubber at grubber cz>
# Based on Fedora python-yubico.spec

pkgname=python2-yubico
pkgver=1.3.1
pkgrel=1
pkgdesc="Pure-python library for interacting with Yubikeys"
arch=('any')
url="https://github.com/Yubico/python-yubico"
license=('GPL')
depends=('python2-pyusb>=1.0.0')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("https://github.com/Yubico/python-yubico/archive/python-yubico-$pkgver.tar.gz")
sha256sums=('80a51a2eccde17724b7da3b04558e81ec49f94cc29dc1c13ab51a594d50a6b4a')

build() {
    cd python-yubico-python-yubico-$pkgver

    python2 setup.py build
}

check() {
    cd python-yubico-python-yubico-$pkgver

    # Exclude tests that require a physical yubikey attached.
    nosetests2 -e test_challenge_response -e test_serial -e test_status
}

package() {
    cd python-yubico-python-yubico-$pkgver

    python2 setup.py install -O1 --skip-build --root "$pkgdir"
}
