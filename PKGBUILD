# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=json-schema-for-humans
pkgver=1.5.1
pkgrel=1
pkgdesc="Quickly generate HTML documentation from a JSON schema"
arch=(any)
url="https://github.com/coveooss/json-schema-for-humans"
license=(Apache-2.0)
depends=(
  python
  python-click
  python-dataclasses-json
  python-jinja
  python-markdown2
  python-pygments
  python-pytz
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(
  python-beautifulsoup4
  python-pytest
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('48745fe3908cbac79944991dc2b5f380610caa4b57df9dbec325264bb31e906b')

build() {
  cd $pkgname-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $pkgname-$pkgver
  pytest \
    --deselect=tests/cli_test.py::test_config_parameters_with_nonexistent_output_path \
    --deselect=tests/cli_test.py::test_nonexistent_output_path
}

package() {
  cd $pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
