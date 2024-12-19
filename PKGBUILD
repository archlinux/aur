# Maintainer: envolution
# Contributor: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: yochanamarqos
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-cutie
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="Command line User Tools for Input Easification"
arch=('any')
url="https://github.com/Kamik423/cutie"
license=('MIT')
depends=('python' 'python-colorama' 'python-readchar')
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(python-pytest)
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz"
  setupfix.patch
)
sha256sums=('0798dee98e71d84ebc01a125155c8d94c96cc9d04cf69294d8b9a68edd93696d'
            'ced31d038d5dfc7582178fbd9b76158a72b84cfc9caba52f120e0e81606f4c7b')

prepare() {
  cd "$_name-$pkgver"
  patch -Np0 -i ../setupfix.patch
}
build() {
  cd "$_name-$pkgver"
  python -m build --no-isolation --wheel
}
check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "license.md" -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "readme.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
# vim:set ts=2 sw=2 et:
