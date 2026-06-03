# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-diffsynth
_pkgname=diffsynth
pkgver=2.0.12
pkgrel=1
pkgdesc="Enjoy the magic of Diffusion models! Diffusion engine by the ModelScope team"
arch=('any')
url="https://github.com/modelscope/DiffSynth-Studio"
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch'
    'python-torchvision'
    'python-transformers'
    'python-imageio'
    'python-safetensors'
    'python-einops'
    'python-sentencepiece'
    'python-protobuf'
    'python-modelscope'
    'python-ftfy'
    'python-pandas'
    'python-accelerate'
    'python-peft'
    'python-datasets'
    'ffmpeg'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools'
)
optdepends=(
    'python-av: audio extra (av/torchaudio/torchcodec/librosa)'
    'python-torchaudio: audio extra'
    'python-librosa: audio extra'
    'streamlit: all extra (web UI)'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('3289847837f5cdb323fa6c238bdc0f01136595786bf95000552effe1b8286d25')

build() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import diffsynth; print(getattr(diffsynth, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/${_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
