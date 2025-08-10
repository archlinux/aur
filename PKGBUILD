pkgname=python-pylatinize
_pkgname="${pkgname#python-}"
pkgdesc="a library to handle path in okeanos system"
pkgver=0.0.1
pkgrel=1
arch=("any")
url="https://github.com/playfulsparkle/pylatinize"
license=("BSD3")

depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel)
checkdepends=(
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/playfulsparkle/pylatinize/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1776cdd3993c1199e80e8a2b6df74fbc10f9d81e46313638893a865af00d0f28')

build() {
  cd ${srcdir}/"$_pkgname-$pkgver"
  rm -rf ${srcdir}/"$_pkgname"/dist
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest tests
}

package() {
  cd ${srcdir}/"$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 {CHANGELOG,README}.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
