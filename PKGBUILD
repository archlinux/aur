# Maintainer: Achim Schumacher <aur@code.grisumedia.de>
# Contributor: Pawel Mozdzonek <rockplayer.pl@gmail.com>

pkgname=python-garth
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="Python module for Garmin SSO auth + Connect client"
arch=(any)
url="https://github.com/matin/garth"
license=(MIT)
depends=(
  python-oauthlib
  python-requests-oauthlib
  python-pydantic
  python-pydantic-settings
  python-pdm-backend
)
optdepends=()
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  python-hatchling
)
checkdepends=(python-oauthlib)

source=("${pkgname}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4f7cec1de5f58015e56c712be0eee07a6bfd1563d160f90aabe51d103b917240')

_archive="${_name}-${pkgver}"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"

  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
