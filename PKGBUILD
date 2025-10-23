# Maintainer: envolution
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lapx
pkgver=0.7.1
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
sha256sums=('f904662d74d8c8e97ef29557af045708f4e631c9779a2b73295a5fa2eb59d7f9')

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
