# Maintainer: Orion-zhen <https://github.com/Orion-zhen>

pkgname=python-mistral-common-git
_pkgname=mistral-common
pkgver=1.11.0.r0.g7843bc8
pkgrel=1
pkgdesc=" Official inference library for pre-processing of Mistral models"
arch=("x86_64")
url="https://github.com/mistralai/mistral-common"
provides=("${pkgname%-git}" "${_pkgname}")
conflicts=("${pkgname%-git}")
license=("Apache-2.0")
depends=(
  python
  python-huggingface-hub
  python-jinja
  python-numpy
  python-jsonschema
  python-pillow
  python-pydantic
  python-pydantic-settings
  python-requests
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-poetry
  python-setuptools
)
source=(
  "git+https://github.com/mistralai/mistral-common"
)
sha256sums=(
  "SKIP"
)

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  cd "$srcdir/${_pkgname}"
}

build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENCE -t ${pkgdir}/usr/share/licenses/python-${_pkgname}/
}
