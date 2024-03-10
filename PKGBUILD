# Maintainer: Randomize <randomize64 at pm dot me>

pkgname=python-unityparser
_name=${pkgname#python-}
pkgver=3.0.1  # Replace VERSION with the actual version number
pkgrel=1
pkgdesc="A python library to parse and dump Unity YAML files"
arch=(any)
url="https://github.com/socialpoint-labs/unity-yaml-parser"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-pytest
  python-installer
  python-setuptools
  python-wheel
)
depends=(python)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('d10828fd322692794f5049d85cdb41bbe8a2d186db101ca4abe79411c46dfd61')

_archive="unity-yaml-parser-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"
  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
