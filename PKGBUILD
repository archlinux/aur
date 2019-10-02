# Maintainer: Marko Korhonen <reekymarko at reekynet.com>
# Based on Fedora python-yubico.spec

pkgname=python-yubico
pkgver=1.3.3
pkgrel=1
pkgdesc="Pure-python library for interacting with Yubikeys"
arch=('any')
url="https://github.com/Yubico/python-yubico"
license=('BSD')
depends=('python-pyusb>=1.0.0')
makedepends=('python-setuptools')
checkdepends=('python-nose')
source=("https://github.com/Yubico/python-yubico/archive/python-yubico-$pkgver.tar.gz")
sha256sums=('fa5c7b40322b31899060b65831a95429c5bbe1c1c800f95cb4b5ff00655523fe')

build() {
    cd "python-yubico-python-yubico-$pkgver"

    python3 setup.py build
}

check() {
    cd "python-yubico-python-yubico-$pkgver"

    # Exclude tests that require a physical yubikey attached.
    nosetests3 -e test_challenge_response -e test_serial -e test_status
}

package() {
    cd "python-yubico-python-yubico-$pkgver"

    python3 setup.py install -O1 --skip-build --root "$pkgdir"

    install -D -m644 -t "$pkgdir"/usr/share/licenses/"$pkgname" COPYING
    install -D -m644 -t "$pkgdir"/usr/share/doc/"$pkgname" NEWS README
}
