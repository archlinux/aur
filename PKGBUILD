# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Contributor: Drew DeVault <sir@cmpwn.com>

pkgname=python-sshpubkeys
pkgver=3.1.0
pkgrel=5
pkgdesc='OpenSSH public key parser for Python'
arch=(any)
url='https://github.com/ojarva/python-sshpubkeys'
license=(BSD)
depends=(python-ecdsa python-cryptography)
makedepends=(python-setuptools)
source=("https://github.com/ojarva/python-sshpubkeys/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=(e411b7d7d42b6909c09c4f8899f4ff55eff52dc13026ef9c26f7a2762766657c)

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

check() {
    cd $pkgname-$pkgver
    python -m unittest -v tests
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
