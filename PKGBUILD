# Maintainer: Sam  <dev at samarthj dot com>

# shellcheck disable=2034,2148,2154,2155

pkgname=python-pytest-drop-dup-tests
_pkgname=${pkgname#python-}
pkgver=0.3.0
pkgrel=2
pkgdesc="A utility to find python versions on your system."
arch=("any")
url="https://github.com/nicoddemus/pytest-drop-dup-tests"
license=("MIT")
depends=("python-pytest")
makedepends=(
  "python-build"
  "python-setuptools"
  "python-installer"
  "python-wheel"
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('a8a0d91a0691af5f196ad923c89017ae5a3ad01d2e61245fc676ca6d4939b5dd521c5ba88bc55a153a4976921c17fa5b2877fe00cdbf83632603b1c3f61783dc')
b2sums=('46b908623942bfbf0f04c1f839b26be350aff768c1bdb10a7a84c7687e27414ee95d966fd9989012cc57ae7ffd81412befd2df2ecb68a9bc78822da0e576d17b')

build() {
  cd "$_pkgname-$pkgver" || exit 1
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$_pkgname-$pkgver" || exit 1
  PYTHONPATH="$srcdir/$_pkgname-$pkgver" pytest
}

package() {
  cd "$_pkgname-$pkgver" || exit 1
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 "README.rst" -t "$pkgdir/usr/share/doc/$pkgname/"
}
