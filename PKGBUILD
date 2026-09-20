# Maintainer: Smoolak <smoolak@gmail.com>

pkgname='python-rotary-embedding-torch'
_module='rotary-embedding-torch'
pkgver=0.9.1
pkgrel=1
pkgdesc="Rotary Embedding - Pytorch"
url="https://github.com/lucidrains/rotary-embedding-torch"
depends=('python' 'python-pytorch>=2.4' 'python-einops>=0.8')
optdepends=('python-triton: fused FlashAttention kernels')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
license=('MIT')
arch=('any')
_commit=9a46f1a58a40ad752a647b91b6003290249ef3b5
_src_folder="rotary-embedding-torch-$_commit"
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('53788db6501028110267f006a6650054484778a5aabe9a78a64a14ab90909aea')

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
