# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=socid-extractor
pkgver=0.0.25
pkgrel=1
pkgdesc="Extract accounts info from personal pages on various sites for OSINT purpose"
arch=(any)
url="https://github.com/soxoj/socid-extractor"
license=(GPL3)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
depends=(
  python
  python-beautifulsoup4
  python-dateutil
  python-requests
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0855d099e085b95c767aaf25c06b38f768ab1e779488797f1b470794fbb0c400')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  # Avoid including tests in the wheel
  rm -r tests/

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
