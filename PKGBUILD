# Maintainer: envolution
# Contributor:fanyujun <dlutfyj@outlook.com>

pkgname="python-thop"
_pkgname="pytorch-OpCounter"
epoch=1
pkgver=0.1.1.post2209072238
pkgrel=3
pkgdesc='Count the MACs / FLOPs of your PyTorch model.'
arch=(any)
url="https://github.com/Lyken17/pytorch-OpCounter"
license=(MIT)
depends=(python python-pytorch)
makedepends=(git python-build python-installer python-setuptools python-wheel)
source=("git+$url#commit=43c064a")
sha256sums=('6dea63d70a3fd74b50d32d8caf774c56682e04c056f3e49fe08f629a72707920')

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i '21d' setup.py
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  depends+=()
  cd "${srcdir}/${_pkgname}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
