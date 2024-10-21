# Maintainer: Danny Waser (Waser Technologies) <waser@waser.tech>
# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Actionless Loveless <actionless DOT loveless PLUS aur AT gmail MF com>

pkgname="python-tts"
pkgver=0.22.0
pkgrel=3
pkgdesc="Coqui deep learning toolkit for Text-to-Speech, battle-tested in research and production"
url="https://github.com/coqui-ai/TTS"
license=("MPL2")
arch=("any")
provides=("tts" "python-tts")
conflicts=("python-tts")
depends=("cython0"
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
         "python-coqui-trainer"
         "python-coqpit"
         "python-gruut"
         "python-jieba"
         "pypinyin"
         "python-jamo-git"
         "python-bangla"
         "python-bnnumerizer"
         "python-bnunicodenormalizer"
)
makedepends=("python-build" "python-installer" "python-wheel")
optdepends=("python-umap-learn: for notebooks"
            "python-pandas: for notebooks"
            "python-matplotlib: for training"
            "python-mecab: for japanese"
            "python-unidic-lite: for japanese"
            "python-nltk: for korean"
            #"python-g2pkk: for korean"
            #"python-k_diffusion: for tortoise"
            "python-einops: for tortoise"
            "python-transformers: for tortoise"
)
options=("!strip")
source=("https://github.com/coqui-ai/TTS/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4331e54b2fe1909c0b0e0ad358318f2e1006bc2709a79b66a63abb94e5360026cc1806b41ea264df14884475e7f28d707e8a800874746ab35aac6d8977210881')

prepare(){
 # remove hardcoded versions
 sed -i "TTS-$pkgver/setup.py" \
     -e "s|3.12|4.0|g"
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
