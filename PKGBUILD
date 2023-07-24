# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-webdriver-manager
_name=webdriver_manager
pkgver=3.9.1
pkgrel=1
pkgdesc="Simplify management of binary drivers for different browsers in Selenium"
arch=(any)
url="https://github.com/SergeyPirogov/webdriver_manager"
license=(Apache)
depends=(
  python
  python-dotenv
  python-packaging
  python-requests
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pybrowsers
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb087f041d52e9e12c3a11a476d728c5feb01cc274b380c51842eab156e79b56')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest \
    tests/test_custom_logger.py \
    tests/test_silent_global_logs.py \
    tests/test_utils.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
