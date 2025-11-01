# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

_name=pytango
pkgname=python-${_name}
pkgver=10.1.1
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=("x86_64" "armv7h" "aarch64")
url="https://gitlab.com/tango-controls/${_name}"
license=("LGPL-3.0-or-later" "PSF-2.0")
groups=("tango-controls")
depends=(
  "tango-cpp>=10.0.0" "boost" "boost-libs" "python-numpy" "python-packaging" "python-psutil" "python-coverage" "pybind11>=3.0.1" "ruff" "python-ruff"
)
makedepends=(
  "cmake" "ninja"
  "python-build" "python-scikit-build-core" "python-pybind11-stubgen"
  "python-sphinx_rtd_theme" "python-sphinx" "python-installer"
)
optdepends=(
  "python-pytest: for testing"
  "python-gevent: for testing"
  "python-opentelemetry-sdk: to add telemetry"
  "python-opentelemetry-api: to add telemetry"
  "python-opentelemetry-exporter-otlp-proto-grpc: to add telemetry"
  "python-opentelemetry-exporter-otlp-proto-http: to add telemetry"
)
source=(
  "https://gitlab.com/tango-controls/${_name}/-/releases/v${pkgver}/downloads/${_name}-with-submodules-v${pkgver}.tar.gz"
)
sha256sums=(
  "fdf805db03a265b9ec02be8772c5a2b61b65c3b1fd3acf0dfd1e65f0f89fd6af"
)

build() {
  cd "${_name}-with-submodules-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-with-submodules-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
