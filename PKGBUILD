# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.0.3
pkgrel=2
pkgdesc="A custom pyton codec that provides an RSpec style dsl for python"
url="https://github.com/delfick/nose-of-yeti"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-asynctest' 'python-pytest' 'python-alt-pytest-asyncio'
              'python-pytest-helpers-namespace')
source=("https://github.com/delfick/nose-of-yeti/archive/release-$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('7bb849e190607b95873525d3d3c182f87252c8199936c25ac1c4af1548fe65e2e755015d79c20da72096d80559908e56e19a618bf72cadf66771f55164a9c07d')

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
