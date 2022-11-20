# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-filelock
pkgver=3.8.0
pkgrel=1
pkgdesc="A platform independent file lock"
url="https://github.com/benediktschmitt/py-filelock"
license=('custom:Unlicense')
arch=('any')
depends=('python38')
makedepends=('python38-setuptools' 'python38-setuptools-scm')
checkdepends=('python38-pytest' 'python38-pytest-timeout')
source=("$pkgname-$pkgver.tar.gz::https://github.com/benediktschmitt/py-filelock/archive/$pkgver.tar.gz")
sha512sums=('a9b63ab9a6697334eb8c561c422e8ec6febd0b7b203c0ebb4cfd1e4281f16cc0ef5145121c90f3c08bec88f13e219c0655142e3d3f856163702a0d32e14cd5ce')

export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver

build() {
  cd py-filelock-$pkgver
  python3.8 setup.py build
}

check() {
  cd py-filelock-$pkgver
  PYTHONPATH=src pytest tests
}

package() {
  cd py-filelock-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
