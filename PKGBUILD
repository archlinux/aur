# Maintainer: envolution
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lapx
pkgver=0.9.2
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
sha256sums=('ac5fefeefe9c228a290f0b4befd7d9977a1c2eb5ef6c13ad5b0dfe765d8ada50')

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
