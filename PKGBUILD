# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cq-kit
pkgver=0.5.1
pkgrel=1
pkgdesc="A python library of CadQuery tools and helpers for building 3D CAD models."
arch=(x86_64)
url="https://github.com/michaelgale/cq-kit"
license=('MIT')
depends=(
#TODO
python-cadquery
)
makedepends=(
python-build
python-installer
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/michaelgale/cq-kit/archive/refs/tags/v.${pkgver}.tar.gz")
sha256sums=('f2a74b5c1b761d829512ca1b24bee8c7209cda9a1c9106e7c4db40ca58d09763')

prepare() {
  cd cq-kit-v.${pkgver}
  rm -rf dist
  #curl --silent https://patch-diff.githubusercontent.com/raw/gumyr/cq_warehouse/pull/37.patch | patch -p1
}

build() {
  cd cq-kit-v.${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  cd cq-kit-v.${pkgver}
  #python -m unittest -v  # project currently configured incorrectly for this to work
}

package() {
  cd cq-kit-v.${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

