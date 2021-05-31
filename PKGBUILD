# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.0.2
_commit=00bd23f1485e39c3489f84737cdfd03567b722b0
pkgrel=1
pkgdesc="A custom pyton codec that provides an RSpec style dsl for python"
url="https://github.com/delfick/nose-of-yeti"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-asynctest' 'python-pytest' 'python-alt-pytest-asyncio'
              'python-pytest-helpers-namespace')
source=("https://github.com/delfick/nose-of-yeti/archive/$_commit/$pkgname-$_commit.tar.gz")
sha512sums=('e666a4afe149efb2c5fb5b1c6f141c508ff9af263c7e421a0bea1706e8f90d28dd730c0232d094bc45da45ed55ea7cf4482d4ee4b68b95605c5a671b7246ce27')

build() {
  cd nose-of-yeti-$_commit
  python setup.py build
}

check() {
  cd nose-of-yeti-$_commit
  PYTHONPATH="$PWD/build/lib" pytest
}

package() {
  cd nose-of-yeti-$_commit
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
