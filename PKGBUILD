# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-tts"
pkgver=0.16.1
pkgrel=1
pkgdesc="Coqui deep learning toolkit for Text-to-Speech, battle-tested in research and production"
url="https://github.com/coqui-ai/TTS"
license=("MPL2")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts")
depends=("cython"
         "python"
         "python-numpy"
         "python-scipy"
         "python-pytorch"
         "python-torchaudio"
         "python-soundfile"
         "python-librosa"
         "python-numba"
         "python-inflect"
         "python-tqdm"
         "python-anyascii"
         "python-yaml"
         "python-fsspec"
         "python-aiohttp"
         "python-packaging"
         "python-flask"
         "python-pysbd"
         )
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("python-umap-learn: for notebooks"
            "python-pandas: for notebooks"
            "python-matplotlib: for training"
            "python-coqui-trainer: for training"
            "python-coqpit: for configuration"
            "python-gruut: for german, spanish, french"
            "python-jieba: for chinese"
            "pypinyin: for chinese"
            "python-mecab: for japanese"
            "python-unidic-lite: for japanese"
            "python-jamo-git: for korean"
            "python-nltk: for korean"
            #"python-g2pkk: for korean"
            #"python-bangla: for bangla"
            #"python-bnnumerizer: for bangla"
            #"python-bnunicodenormalizer: for bangla"
            #"python-k_diffusion: for tortoise"
            "python-einops: for tortoise"
            "python-transformers: for tortoise"
)
options=("!strip")
source=("https://github.com/coqui-ai/TTS/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8a7c349afa8cf81ac92c6722b88a04e9946951dea1d7349ac26e717cbef8b11bb50f255a0968c1551f37f0b7bfea7d2887b3db38c2d7ca484538a8d88f08fd0c')

prepare(){
 # remove hardcoded versions
 sed -i "TTS-$pkgver/setup.py" \
     -e "s|3.11|4.0|g"
 sed -i "TTS-$pkgver/requirements.txt" \
     -re "s|cython==[0-9]+\.[0-9]+\.[0-9]+|cython|g" \
     -re "s|numpy==[0-9]+\.[0-9]+\.[0-9]+|numpy|g"
 sed -i "TTS-$pkgver/pyproject.toml" \
     -re "s|cython==[0-9]+\.[0-9]+\.[0-9]+|cython|g" \
     -re "s|numpy==[0-9]+\.[0-9]+\.[0-9]+|numpy|g"
}

build(){
 cd "TTS-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "TTS-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
