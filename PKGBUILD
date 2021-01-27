# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

_pkgname=sshpubkeys
pkgname=python-sshpubkeys
pkgver=3.3.0
pkgrel=1
pkgdesc='OpenSSH public key parser for Python'
arch=(any)
url='https://github.com/ojarva/python-sshpubkeys'
license=(BSD)
depends=(python-ecdsa python-cryptography)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/s/sshpubkeys/$_pkgname-$pkgver.tar.gz")
sha256sums=('89e10a0caf38407426a05e3f5b5243d6e2f9575d6af45e9321291d20bcfca8f7')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

check() {
    cd $_pkgname-$pkgver
    python -m unittest tests
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
