# Maintainer: Kirill Pshenichnyi <pshcyrill@mail.ru>
# Maintainer: Antonio Bartalesi <antonio.bartalesi@gmail.com>
# Contributor: The Tango Controls community
#              (https://tango-controls.org) <info@tango-controls.org>

_name=pytango
pkgname=python-${_name}
pkgver=10.3.1
pkgrel=1
pkgdesc="A python binding for the Tango control system"
arch=("x86_64" "armv7h" "aarch64")
url="https://gitlab.com/tango-controls/${_name}"
license=("LGPL-3.0-or-later" "PSF-2.0")
groups=("tango-controls")
depends=(
  "tango-cpp>=10.3.0" "boost" "boost-libs" "python-numpy" "python-packaging" "python-psutil" "python-coverage" "pybind11>=3.0.1" "ruff" "python-ruff"
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
sha256sums=('4090c85e4534a53d88f160fd949e857b16944788cba0252eeda366466185e5c8')

build() {
  cd "${_name}-with-submodules-v${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-with-submodules-v${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
