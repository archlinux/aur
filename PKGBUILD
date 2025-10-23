# Maintainer: Xubai Wang <18016038327@189.cn>
pkgname=lue-reader-git
_name=lue
pkgver=v0.3.1.r0.g99e95f5
pkgrel=1
pkgdesc="Terminal eBook Reader with Text-to-Speech"
arch=('any')
url="https://github.com/superstarryeyes/lue"
license=('GPL3')
conflicts=('lue-reader')
provides=("lue-reader=${pkgver}")
depends=(
  # docs
  'ffmpeg'
  # from pyproject.toml
  'python-docx'
  'python-striprtf'
  'python-rich'
  'python-pymupdf'
  'python-markdown'
  'python-platformdirs'
  'python-edge-tts'
)
optdepends=(
  'espeak: Kokoro TTS support'
  'antiword: .doc file support'
  'python-kokoro'
  'python-soundfile'
  'python-huggingface-hub'
)
makedepends=(
  # VCS
  'git'
  # using PEP 517
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("git+https://github.com/superstarryeyes/lue.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$_name"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${_name}" clean -dfx
}

build() {
  cd $_name
  python -m build --wheel --no-isolation
}

package() {
  cd $_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
