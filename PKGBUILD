# Maintainer: Agil Mammadov <mammadovagil@tutamail.com>
# Contributor: Wüstengecko <1579756+Wuestengecko@users.noreply.github.com>

pkgname=python-datauri
_name=${pkgname}
pkgver=3.0.2
pkgrel=1
pkgdesc="A li'l class for data URI manipulation in Python"
arch=(any)
url="https://github.com/fcurella/python-datauri"
license=('Unlicense')
depends=(python python-pydantic-core python-typing_extensions python-cached-property)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pydantic python-pytest)
options=(!strip)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00b975a2c422f40e3ae24553001ef22490d87c197ae5c1003123d69f6887df45')

build() {
  cd "$_name-$pkgver"
  PYTHONHASHSEED=0 python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  PYTHONPATH="$PWD" pytest
}

package() {
  cd "$_name-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests
}
