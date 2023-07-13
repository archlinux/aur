# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgname=python-blessings
_name=${pkgname#python-}
pkgver=1.7
pkgrel=11
pkgdesc="A thin, practical wrapper around terminal coloring, styling, and positioning"
url="https://github.com/erikrose/blessings"
arch=(any)
license=(MIT)
depends=(
  python
  python-six
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-nose
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ee1dc1524631c4fdb9e3a7f1776cbf82ae50cf1edf225d45bf274bebed0c6c36')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  script -c "python -m nose" /dev/null
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
