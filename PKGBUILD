# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-webdriver-manager
_name=webdriver_manager
pkgver=4.0.1
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
sha256sums=('fbf249e4c8c8021fe0ef279e3eb39ba0b6a3d6662dfe4e6f0a02b16d174005a2')

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
