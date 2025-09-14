# Maintainer: taotieren <admin@taotieren.com>

pkgbase=python-underthesea
pkgname=python-underthesea
_name=${pkgname#python-}
pkgver=6.8.4
pkgrel=1
epoch=
pkgdesc="Vietnamese NLP Toolkit"
arch=('any')
url="https://pypi.org/project/${_name}"
license=(MIT)
groups=()
depends=(
    python
    python-beautifulsoup4
    python-charset-normalizer
    python-click
    python-fire
    python-google-auth-oauthlib
    python-joblib
    python-librosa
    python-nltk
    python-numpy
    python-matplotlib
    python-scipy
    python-scikit-learn
    python-soundfile
    python-regex
    python-requests
    python-openai
    python-pandas
    python-pydub
    python-pygithub
    python-pytorch
    python-tabulate
    python-yaml
    python-tqdm
    # AUR
    python-einops
    python-crfsuite
    python-dm-haiku
    python-fasttext
    python-jax
    python-playsound
    python-seqeval
    python-optax
    python-transformers
    python-youtube-transcript-api
    python-underthesea-core
)
makedepends=(
    python-hatchling
    python-build
    python-installer
    python-wheel
    python-setuptools
)
optdepends=()
options=('!strip' '!debug')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
noextract=()
sha256sums=('ed14b82c7acfc1b11e025494fe941dac572b588ae92e3bc5d9ac909f0b3954c8')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    provides=(${pkgname})
    conflicts=(${pkgname})
    optdepends=(python-underthesea-{train,deep,wow,prompt,langdetect})

    cd "${srcdir}/${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
