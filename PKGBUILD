pkgname=python-cq_warehouse
pkgver=0.8.0
pkgrel=2
pkgdesc="A cadquery parametric part collection"
arch=(x86_64)
url="https://github.com/gumyr/cq_warehouse"
license=('Apache')
depends=(
python-cadquery
)
makedepends=(
python-build
python-pytest
python-installer
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gumyr/cq_warehouse/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('150aca4cd339083a0f1184e6c56553ccc3d1a770992f100fd1c31e02ca56b427')

prepare() {
  cd cq_warehouse-${pkgver}
  rm -rf dist
  #curl --silent https://patch-diff.githubusercontent.com/raw/gumyr/cq_warehouse/pull/37.patch | patch -p1
}

build() {
  cd cq_warehouse-${pkgver}
  python -m build --wheel --no-isolation
}

#check() {
#  cd cq_warehouse-${pkgver}/tests
#  python -m unittest -v  # project currently configured incorrectly for this to work
#}

package() {
  cd cq_warehouse-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

