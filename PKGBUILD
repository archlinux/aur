# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=socid-extractor
pkgver=0.0.23
pkgrel=2
pkgdesc="Extract accounts info from personal pages on various sites for OSINT purpose"
arch=(any)
url="https://github.com/soxoj/socid-extractor"
license=(GPL3)
makedepends=(python-setuptools)
depends=(
  python-beautifulsoup4
  python-dateutil
  python-requests
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('67ed7e5963bd3fa7abf1fe6c92a0126a74816d4eacf863afde158a216d867a30')

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  # Don't lock dependency versions.
  sed -i 's/>=.*//' requirements.txt
  sed -i 's/~=.*//' requirements.txt
  sed -i 's/==.*//' requirements.txt
}

build() {
  cd "$_archive"

  python setup.py build
  rm -r build/lib/tests/
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
