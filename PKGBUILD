# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

_name="py-motmetrics"
pkgname="python-motmetrics"
pkgver=1.4.0
pkgrel=9
pkgdesc='The py-motmetrics library provides a Python implementation of metrics for benchmarking multiple object trackers (MOT).'
arch=(any)
url="https://github.com/cheind/$_name"
license=(MIT)
depends=(python python-xmltodict python-scipy python-pandas python-numpy)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($_name.tar.gz::"$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ec637ba10f02105c8a6d7a702ff85a06dd4487343a61274f0ced52ec43d25320')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/${_name}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
