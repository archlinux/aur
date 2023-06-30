# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-strenum
_name=StrEnum
pkgver=0.4.15
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-pytest-runner'
             'python-setuptools' 'python-wheel')
checkdepends=('python-pytest-black' 'python-pytest-cov' 'python-pytest-pylint')
source=("$_name-$pkgver.tar.gz::https://github.com/irgeek/StrEnum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ab442e918760a39a3b07e7923c128ff13a0bbebc6a173cda67237acb738d7e49')

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
