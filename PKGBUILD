# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Maintainer: Barra Ihsan <barra at duck dot com>

pkgname=('python-stable-ts-git')
_gitname=('stable-ts')
pkgver=r295.fefaf46
pkgrel=1
pkgdesc="Transcription, forced alignment, and audio indexing with OpenAI's Whisper"
url="https://github.com/jianfch/stable-ts"
license=('MIT')
source=('git+https://github.com/jianfch/stable-ts.git')
b2sums=('SKIP')
arch=('any')
depends=('python-openai-whisper')
makedepends=('git' 'python-setuptools')
provides=('python-stable-ts')
conflicts=('python-stable-ts')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  python setup.py build
}

package() {
  cd "${_gitname}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
