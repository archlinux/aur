# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

_pkgname=sshpubkeys
pkgname=python-sshpubkeys
pkgver=3.3.1
pkgrel=5
pkgdesc='OpenSSH public key parser for Python'
arch=(any)
url='https://github.com/ojarva/python-sshpubkeys'
license=(BSD)
depends=(python-ecdsa python-cryptography)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("https://github.com/ojarva/python-sshpubkeys/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('04dbd4ed78b288b0cb2b265f7594367676d740d5ce0eda66cb745aaa9a597125')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    python -m unittest tests
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
