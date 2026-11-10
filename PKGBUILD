# Maintainer: Smoolak <smoolak@gmail.com>

pkgname='python-rotary-embedding-torch'
_module='rotary-embedding-torch'
pkgver=0.9.2
pkgrel=1
pkgdesc="Rotary Embedding - Pytorch"
url="https://github.com/lucidrains/rotary-embedding-torch"
depends=('python' 'python-pytorch>=2.4' 'python-einops>=0.8')
optdepends=('python-triton: fused FlashAttention kernels')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
_commit=6d7071e10d8aefa651526b797c00d33d106f1473
_src_folder="rotary-embedding-torch-$_commit"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('a2cd6dcae6876f62e8ab91b7fc2a61d1d25e6b457756a4f71fe43202de0bee4c')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_src_folder}"
    CUDA_VISIBLE_DEVICES='' pytest -ra
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
