pkgname=python-deepspeed
pkgver=0.10.0
pkgrel=1
pkgdesc="DeepSpeed is a deep learning optimization library that makes distributed training and inference easy, efficient, and effective. "
depends=(
  'python-hjson'
  'python-ninja'
  'python-numpy'
  'python-packaging'
  'python-psutil'
  'python-py-cpuinfo'
  'python-pydantic'
  'python-pytorch'
  'python-tqdm'
)
makedepends=(python-build python-installer python-wheel)
arch=('x86_64')
url="https://github.com/microsoft/DeepSpeed"
license=('Apache-2.0')
source=("https://github.com/microsoft/DeepSpeed/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a03840cf9735b97c5207516adaeaba6ae53c5db481551ef8e93c7e4b253a726b')

build() {
  cd "${srcdir}/DeepSpeed-$pkgver"
  DS_BUILD_OPS=1 DS_BUILD_SPARSE_ATTN=0 python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/DeepSpeed-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
