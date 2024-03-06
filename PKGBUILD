# Maintainer: fanyujun <dlutfyj@outlook.com>
# Contributor:

pkgname="python-thop"
_pkgname="pytorch-OpCounter"
epoch=1
pkgver=0.1.1.post2209072238
pkgrel=1
pkgdesc='Count the MACs / FLOPs of your PyTorch model.'
arch=(any)
url="https://github.com/Lyken17/pytorch-OpCounter"
license=(MIT)
depends=(python python-pytorch)
conflicts=()
makedepends=(python-build python-installer python-setuptools python-wheel)
source=("git+$url#commit=43c064a")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  sed -i '21d' setup.py
  python -m build --wheel --skip-dependency-check --no-isolation
}

package(){
  depends+=()
  cd "${srcdir}/${_pkgname}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

