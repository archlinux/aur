# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-jose
pkgver=3.3.0
pkgrel=3
pkgdesc="A JOSE implementation in Python"
arch=('any')
license=('MIT')
url="https://github.com/mpdavis/python-jose"
depends=('python38-rsa' 'python38-six' 'python38-ecdsa' 'python38-future')
optdepends=('python38-cryptography: one option for better performance'
            'python38-pycryptodome: one option for better performance')
makedepends=('python38-setuptools' 'python38-rsa' 'python38-six' 'python38-ecdsa' 'python38-future' 'python38-pytest-runner')
checkdepends=('python38-cryptography' 'python38-pycryptodome' 'python38-pytest-cov')
source=("https://github.com/mpdavis/python-jose/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('de7147cc6e12406d6e459c32829acae46395acba727c53e65bc05f4794ee3050eecd355e3ae2e87f4ebdbd871f53822eea08a10f25d7ca6088fc6128dc7d9637')

prepare() {
  cd python-jose-$pkgver
  sed -i 's/<0.15//' setup.py
}

build() {
  cd python-jose-$pkgver
  python3.8 setup.py build
}

check() {
  cd python-jose-$pkgver
  # https://github.com/mpdavis/python38-jose/issues/176
  python3.8 setup.py pytest --addopts "--deselect tests/algorithms/test_EC.py::TestECAlgorithm::test_key_too_short"
}

package() {
  cd python-jose-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
