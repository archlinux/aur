# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.7
pkgrel=2
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-black' 'python-pytest-cov' 'python-pytest-pylint' 'python-pytest-runner')
source=("$_name-$pkgver.tar.gz::https://github.com/irgeek/StrEnum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('996e2ebf5eab505dbfdf2c03ea0c54753dde352e1aa31a930b0e917962bedd2f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
