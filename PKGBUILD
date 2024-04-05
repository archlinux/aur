# Maintainer: David Runge <dvzrv@archlinux.org>

_name=bincopy
pkgname=python-bincopy
pkgver=20.0.0
pkgrel=2
pkgdesc="Mangling of various file formats that conveys binary information"
arch=(any)
url="https://github.com/eerimoq/bincopy"
license=(MIT)
depends=(
  python
  python-argparse-addons
  python-humanfriendly
  python-pyelftools
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha512sums=('b236852299fb54b8c1bfcb61c2229d8e76aa0a7c4b7eebe60d242e8e8d93c007ea160ab4e7f219d4dbf9447d3647355c54b81022e31ab892c81def459adb4ec8')
b2sums=('0f10709492f5b9af7a072e74f5a45d1a734cad2b9dcb1591914bfb4353bd9ca21e94c61d4937349d00b61c86fa4fd9b34a4d7dc6b10e2c70eb1061bfe7ec3922')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_name-$pkgver
  pytest -vv
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname"
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
