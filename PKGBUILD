# Maintainer:
# Contributor: Grey Christoforo <grey at christoforo dot net>

pkgname=python-nptyping
_name="${pkgname#python-}"
pkgver=2.5.0
pkgrel=3
pkgdesc='Type hints for Numpy'
url="https://github.com/ramonhagenaars/nptyping"
arch=(x86_64)
license=(MIT)
depends=(
  python
  python-numpy
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
)
source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha512sums=('2cde9c5f7694d4f916b85c93b86df7f72709a70b2ffa91b7bbc98c5884236f5b36bb545a89c37e8c02a9b460065c97151d77c64f8d93b92fd93bcff406f039d9')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
