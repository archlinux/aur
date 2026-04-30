# Maintainer: Evert Vorster <evorster at gmail dot com>

pkgname=python-ko-speech-tools
_name=ko_speech_tools
pkgver=0.1.0
pkgrel=1
pkgdesc="Korean speech/NLP tools"
arch=(any)
url="https://github.com/eginhard/ko-speech-tools"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-wheel python-uv-build)
optdepends=('python-mecab-ko: for Korean G2P support')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('dcc5af8bd9f2a9d2260dcc36617d6de65106be625958302525068e81f94b2b1d')

prepare() {
  cd "$_name-$pkgver"
  sed -i 's/uv_build>=0.8.18,<0.9.0/uv_build>=0.8.18/' pyproject.toml
}

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
