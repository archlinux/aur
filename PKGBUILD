# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.8
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-black' 'python-pytest-cov' 'python-pytest-pylint' 'python-pytest-runner')
source=("$_name-$pkgver.tar.gz::https://github.com/irgeek/StrEnum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fcf8541ac2d2ae220dc628db6e16e9d5abbd17abbdc46cff92893cc807bd7d8b')

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
