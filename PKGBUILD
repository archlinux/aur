# Maintainer: envolution
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lapx
pkgver=0.9.0
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
sha256sums=('136905467d1c979ab66349ba1bb9d035193c0cabd6bfe3211b2babbed9884ec2')

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
