# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-blessings
_name=${pkgname#python-}
pkgver=1.7
pkgrel=10
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
url="https://github.com/erikrose/blessings"
arch=(any)
license=(MIT)
depends=(python-six)
makedepends=(python-setuptools)
checkdepends=(python-nose)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee1dc1524631c4fdb9e3a7f1776cbf82ae50cf1edf225d45bf274bebed0c6c36')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m nose
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
