# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.2.0
pkgrel=1
pkgdesc="A custom pyton codec that provides an RSpec style dsl for python"
url="https://github.com/delfick/nose-of-yeti"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-asynctest' 'python-pytest' 'python-alt-pytest-asyncio'
              'python-pytest-helpers-namespace')
source=("https://github.com/delfick/nose-of-yeti/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b76a1a12ebf6202c0788b7ac74dae06c3162464947a3e5ab6f2fc09bc58dae1442083d43fb0fdaa229d0fc00fe1567becee35102c3b9c82ed34cfb87f072ab87')

build() {
  cd nose-of-yeti-release-$pkgver
  python setup.py build
}

check() {
  cd nose-of-yeti-release-$pkgver
  PYTHONPATH="$PWD/build/lib" pytest
}

package() {
  cd nose-of-yeti-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
