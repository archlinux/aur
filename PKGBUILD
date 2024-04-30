_base=pydub
_pkgname=python-${_base}
pkgname=$_pkgname-git
pkgver=0.25.1.r9.g996cec4
pkgrel=1
pkgdesc="Manipulate audio with a simple and easy high level interface"
url="https://github.com/jiaaro/pydub"
license=(MIT)
arch=('any')
provides=(python-pydub)
conflicts=(python-pydub)
depends=(python ffmpeg)
makedepends=(python-setuptools)
optdepends=('python-pyaudio: for playback'
  'python-simpleaudio: for playback')
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  git -C "${_base}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_base}"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "${_base}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

