# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-auralis
_pkgname=auralis
pkgver=0.2.8.post2
pkgrel=1
pkgdesc="faster implementation for TTS models, to be used in highly async environment"
arch=('i686' 'x86_64')
url='https://github.com/astramind-ai/Auralis'
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/astramind-ai/Auralis/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('b39ccd7af88a252541452af3cfce0d198f8911cab065607d9a034969f4278b30')

build() {
  cd ${_pkgname^}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname^}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 README.md "$pkgdir"/usr/share/doc/$pkgname/README.md
}
# vim:set ts=2 sw=2 et:
