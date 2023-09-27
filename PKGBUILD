# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="tts"
pkgver=0.17.5
pkgrel=1
pkgdesc="Coqui-TSS for inference"
url="https://github.com/coqui-ai/TTS"
license=("MPL2")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts")
replaces=("python-tts")
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
sha256sums=('ba0f9ce4b80cd280c52ecd0ae057e60d1c0ea4b3ac87c657073866abe66c0dd6')

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
