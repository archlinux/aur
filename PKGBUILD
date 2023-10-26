# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

_name="py-motmetrics"
pkgname="python-motmetrics"
pkgver=1.4.0
pkgrel=8
pkgdesc='The py-motmetrics library provides a Python implementation of metrics for benchmarking multiple object trackers (MOT).'
arch=(any)
url="https://github.com/cheind/$_name"
license=(MIT)
depends=(python python-xmltodict python-scipy python-pandas python-numpy)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel)
source=($_name-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('376f9eacc95aac7297d07e2e22c8868b86878cfd650761ce39a428dd41e0e916')

build() {
  cd "${srcdir}/${_name}-master"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/${_name}-master"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
