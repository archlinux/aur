# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-lapx"
epoch=1
pkgver=0.5.9
pkgrel=2
pkgdesc="Customized Tomas Kazmar's lap, Linear Assignment Problem solver (LAPJV/LAPMOD)."
arch=(any)
url="https://github.com/rathaROG/lapx"
license=(BSD-2-Clause)
depends=(python python-scipy python-pytest python-numpy)
provides=(python-lap)
conflicts=(python-lap)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
source=(lapx-0.5.9.tar.gz::"$url/archive/refs/tags/v0.5.9.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/lapx-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/lapx-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
