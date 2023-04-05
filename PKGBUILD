# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-noseofyeti
pkgver=2.4.0
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
sha512sums=('adca5ce14e86f8cc3d40c3a336e57131af2feb1c860e3633cb58e933a82e7ea678b30c4ad88c565b9bceb6dcd66871d3199aa7ec45610859750b46589df169d1')

build() {
  cd nose-of-yeti-release-$pkgver
  python setup.py build
}

check() {
  cd nose-of-yeti-release-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python setup.py install
  test-env/bin/python -m pytest
}

package() {
  cd nose-of-yeti-release-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
