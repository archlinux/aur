# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Alex Hirzel <alex at hirzel period us>

pkgname=python-open-clip-torch
_pkgname=open_clip
pkgver=3.3.0
pkgrel=1
pkgdesc="Open source implementation of OpenAI's CLIP (Contrastive Language-Image Pre-training)"
arch=('any')
url="https://github.com/mlfoundations/open_clip"
license=('MIT')
depends=(
    'python'
    'python-pytorch'
    'python-torchvision'
    'python-regex'
    'python-ftfy'
    'python-tqdm'
    'python-huggingface-hub'
    'python-safetensors'
    'python-timm'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-pdm-backend'
    'python-wheel'
)
optdepends=(
    'python-pandas: for training functionality'
    'python-webdataset: for training with webdataset'
    'python-transformers: for training with transformers models'
    'python-fsspec: for remote filesystem support in training'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/mlfoundations/open_clip/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b72b5ea0a5bb4581a95d75487983fa20ebcf18b60261cc126e127f1eb1abffa')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    PYTHONPATH="$PWD/src:$PYTHONPATH" python -c "import open_clip; print(open_clip.__version__)"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
