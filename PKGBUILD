# Maintainer: Smoolak <smoolak [at] gmail.com>.

pkgname=python-torchprofile
_pkgname=torchprofile
pkgver=0.1.0
pkgrel=1
pkgdesc="Profiler to count the number of MACs / FLOPs of PyTorch models"
arch=('any')
url="https://github.com/zhijian-liu/torchprofile"
license=('MIT')
depends=(
  'python'
  'python-pytorch'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/zhijian-liu/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ce1c4838cc70ce5e1f6d46913357bc302d49d80a45e0bf0fdf98213b34ee28de')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Basic import test
  PYTHONPATH="$PWD:$PYTHONPATH" python -c "import torchprofile; print(torchprofile.__version__)"
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
