# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-thop"
pkgver=1.0.0
pkgrel=2
pkgdesc='Count the MACs / FLOPs of your PyTorch model.'
arch=(any)
url="https://github.com/Lyken17/pytorch-OpCounter"
license=(MIT)
depends=(python python-pytorch)
conflicts=()
makedepends=(python-setuptools)
source=(pytorch-OpCounter-master.zip::"$url/archive/refs/heads/master.zip")
sha256sums=('9dd5999570452100f8082c360ab3d9cbf9bcad22b7fb87ed8bcfff20dbc02433')

build() {
  cd "${srcdir}/pytorch-OpCounter-master"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/pytorch-OpCounter-master"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

