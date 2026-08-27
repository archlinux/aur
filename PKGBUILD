# Maintainer: masutu < masutu dot arch at gmail dot com >

pkgname=python-pycpl
_pkgname=${pkgname#python-}
pkgver=1.0.4
pkgrel=1
pkgdesc="Python bindings for the complete programming API of the ESO Common Pipeline Library (CPL) toolkit."
arch=(x86_64)
url="https://www.eso.org/sci/software/pycpl/"
license=(GPL-3.0-only.txt)
depends=(cpl)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  pybind11
)
source=("https://ftp.eso.org/pub/dfs/pipelines/libraries/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('85e5d3750a0d5bec4be47bce840bfcb47c7c54f0b31587e66b75b6c4ac46a9c4')

_archive="$_pkgname-$pkgver"
build() {
  cd "$_archive"
  rm -rf dist
  python -m build --wheel --no-isolation
}

package() {
  cd "$_archive"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
