# Maintainer: Pawel Mozdzonek <rockplayer.pl@gmail.com>

pkgname=python-garth
_name=${pkgname#python-}
pkgver=0.5.2
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
sha256sums=('aaaac4b9d397378af595eeb04211c8e8f92d64e22e4d78eb3ce970ad2c77d062')

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
