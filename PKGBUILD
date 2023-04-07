# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

_pkgname=sshpubkeys
pkgname=python-sshpubkeys
pkgver=3.3.1
pkgrel=4
pkgdesc='OpenSSH public key parser for Python'
arch=(any)
url='https://github.com/ojarva/python-sshpubkeys'
license=(BSD)
depends=(python-ecdsa python-cryptography)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/s/sshpubkeys/$_pkgname-$pkgver.tar.gz")
sha256sums=('3020ed4f8c846849299370fbe98ff4157b0ccc1accec105e07cfa9ae4bb55064')

build() {
    cd $_pkgname-$pkgver
    python setup.py build
}

check() {
    cd $_pkgname-$pkgver
    # Upstream MANIFEST.in uses `graft tests`, so pyc files in tests will be listed in SOURCES.txt
    PYTHONDONTWRITEBYTECODE=1 python -m unittest tests
}

package() {
    cd $_pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
