# Maintainer: Achim Schumacher <aur@code.grisumedia.de>
# Contributor: Pawel Mozdzonek <rockplayer.pl@gmail.com>

pkgname=python-garth
_name=${pkgname#python-}
pkgver=0.7.9
pkgrel=1
pkgdesc="Python module for Garmin SSO auth + Connect client"
arch=(any)
url="https://github.com/matin/garth"
license=(MIT)
depends=(
  python-oauthlib
  python-requests-oauthlib
  python-pydantic
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

source=("${pkgname}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('6a4ad202cfaffe7ab69bec60eca9e24d99deebaf660cc05f0b89c6fa60a99dc6')

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
