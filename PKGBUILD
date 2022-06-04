# $Id$
# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-cq_warehouse-git
pkgver=v0.6.0.r32.gbe12a7d
pkgrel=1
pkgdesc="A cadquery parametric part collection, dev branch"
arch=(x86_64)
url="https://github.com/gumyr/cq_warehouse"
license=('Apache')
conflicts=(python-cq_warehouse)
provides=(python-cq_warehouse)
depends=(
python-cadquery
)
makedepends=(
python-build
python-installer
git
)

source=('git+https://github.com/gumyr/cq_warehouse.git#branch=dev')
sha256sums=('SKIP')

pkgver() {
  cd cq_warehouse
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  #git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd cq_warehouse
  rm -rf dist  # doesn't belong here
}

build() {
  cd cq_warehouse
  python -m build --wheel --no-isolation
}

check() {
  cd cq_warehouse
  python -m unittest -v  # project currently configured incorrectly for this to work
}

package() {
  cd cq_warehouse
  python -m installer --destdir="${pkgdir}" dist/*.whl
  #python -m installer --destdir="${pkgdir}" dist/cq_warehouse-${pkgver}*.whl
}

