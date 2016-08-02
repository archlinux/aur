# Maintainer: Jan Cholasta <grubber at grubber cz>
# Based on Fedora python-yubico.spec

pkgname=python2-yubico
pkgver=1.3.2
pkgrel=1
pkgdesc="Pure-python library for interacting with Yubikeys"
arch=('any')
url="https://github.com/Yubico/python-yubico"
license=('BSD')
depends=('python2-pyusb>=1.0.0')
makedepends=('python2-setuptools')
checkdepends=('python2-nose')
source=("https://github.com/Yubico/python-yubico/archive/python-yubico-$pkgver.tar.gz")
sha256sums=('3fd3779cdc39a0347e7a0af0923ebfcf5b4feacca6034a1072a03cb18113ed3a')

build() {
    cd "python-yubico-python-yubico-$pkgver"

    python2 setup.py build
}

check() {
    cd "python-yubico-python-yubico-$pkgver"

    # Exclude tests that require a physical yubikey attached.
    nosetests2 -e test_challenge_response -e test_serial -e test_status
}

package() {
    cd "python-yubico-python-yubico-$pkgver"

    python2 setup.py install -O1 --skip-build --root "$pkgdir"

    install -D -m644 -t "$pkgdir"/usr/share/licenses/"$pkgname" COPYING
    install -D -m644 -t "$pkgdir"/usr/share/doc/"$pkgname" NEWS README
}
