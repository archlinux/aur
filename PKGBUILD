# Maintainer: envolution
# Contributor: fanyujun <dlutfyj@outlook.com>

pkgname=python-lapx
pkgver=0.5.12
pkgrel=2
pkgdesc="Customized Tomas Kazmar's lap, Linear Assignment Problem solver (LAPJV/LAPMOD)."
arch=(any)
url="https://github.com/rathaROG/lapx"
license=(BSD-2-Clause)
depends=(python python-scipy python-pytest python-numpy)
provides=(python-lap)
conflicts=(python-lap)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(${pkgname}-${pkgver}.tar.gz::"$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e1e823a368516b4acf3c4eb5ab34980461aeef97716a1b10d46db947000be29e')

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
