# Maintainer: envolution
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lapx
pkgver=0.8.1
pkgrel=1
pkgdesc="Customized Tomas Kazmar's lap, Linear Assignment Problem solver (LAPJV/LAPMOD)."
arch=(any)
url="https://github.com/rathaROG/lapx"
license=(BSD-2-Clause)
depends=(python python-scipy python-pytest python-numpy)
provides=(python-lap)
conflicts=(python-lap)
makedepends=(pybind11 python-build python-installer python-setuptools python-wheel cython)
source=(${pkgname}-${pkgver}.tar.gz::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('89a7510f35ef436d92ce95e742a73282d95a491ff1a91afd7751fd4105f05a78')

build() {
  cd "lapx-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "lapx-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
