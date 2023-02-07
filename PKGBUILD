# Maintainer: jzbor <zborof at posteo dot de>
pkgname=python-accelerate
_name=${pkgname#python-}
pkgver=0.15.0
pkgrel=1
pkgdesc="Train and use PyTorch models with multi-GPU, TPU, mixed-precision"
arch=(any)
url="https://github.com/huggingface/$_name"
license=('MIT')
groups=()
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
checkdepends=(
  "python-pytest"
  "python-datasets"
  "python-evaluate"
  "python-transformers"
  "python-scipy"
  "python-scikit-learn"
  "python-deepspeed"
  "python-tqdm"
)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha512sums=('25c40dc770ffd8d8a8e3f9a9661abe556c47e43d925b7f04977925c10a99a28218b1b33cd84c34d24d4aef8367136b0abd664534ac82cda88265c62f7b9c6ef4')
validpgpkeys=()

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

check() {
    cd "$_name-$pkgver"
    pytest tests
}
