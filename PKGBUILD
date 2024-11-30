# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-auralis
_pkgname=auralis
pkgver=0.2.5
pkgrel=2
pkgdesc="faster implementation for TTS models, to be used in highly async environment"
arch=('i686' 'x86_64')
url='https://httpstan.readthedocs.org'
license=(Apache-2.0)
depends=(python python-safetensors python-numpy python-transformers python-tokenizers)
depends+=(
  python-sounddevice
  python-torchaudio
  python-langid
  python-librosa
  python-pyloudnorm
  python-vllm-bin
  python-mistral-common
  python-msgspec
  python-compressed-tensors
  python-gguf
  python-triton
  python-srsly-bin
  python-nvidia-ml-py
  pypinyin
  python-hangul-romanize
  python-num2words
  python-spacy-bin
  python-cutlet
  python-jaconv
  python-mecab
  python-fugashi
  python-mojimoji
)
makedepends=(python-build python-installer python-wheel)
source=("$pkgname-$pkgver.tar.gz::https://github.com/stan-dev/httpstan/archive/refs/tags/${pkgver}.tar.gz")
source=(https://files.pythonhosted.org/packages/39/bf/cb7b149d02a9dea88cff79b92d873ead02dff1a932226ac76eeb73b3de3b/auralis-${pkgver}.tar.gz)
sha256sums=('dd7c08cf2cac4f4b4dee408a454d6f01018f694640e83102f8fdad13e03f3d2e')

build() {
  cd $_pkgname-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
# vim:set ts=2 sw=2 et:
