# Maintainer: Pawel Mozdzonek <rockplayer.pl@gmail.com>

pkgname=python-garth
_name=${pkgname#python-}
pkgver=0.4.31
pkgrel=1
pkgdesc="Python module for Garmin SSO auth + Connect client"
arch=(any)
url="https://github.com/matin/garth"
license=(MIT)
depends=(
  python-oauthlib
  python-requests-oauthlib
)
optdepends=()
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-oauthlib)

source=("${pkgname}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('666244dd788755bd2ff3987de7a76c06f2b95d592602992a194552ca13dd0458')

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
