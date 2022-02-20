# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.3.1
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
sha512sums=('632cb88ce3da3a17edb40420467e467ea33f3bce86b30edcd9abd907cccf1e9e18fb2e81f2cb17607997c7685b31854f816d63ca2203c3b8aa33abe4c72ccf9a')

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
