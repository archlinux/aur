PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
_pkgname_us="${_pkgname/-/_}" # Package name might have underscore in DL link
pkgname=python-${_pkgname}
pkgver=7.0.0
pkgrel=1
pkgdesc="Use Microsoft Edge's online text-to-speech service from within your Python code or using the provided edge-tts or edge-playback command"
arch=(any)
url=https://github.com/rany2/edge-tts
license=(GPL3)
depends=(python python-aiohttp python-yarl python-typing_extensions python-srt python-tabulate python-frozenlist python-multidict python-charset-normalizer python-aiosignal python-attrs python-idna python-certifi)
makedepends=(
  python-setuptools
  python-build
  python-installer
  python-wheel
)
optdepends=(
	'mpv: immediate tts playback with the provided edge-playback command'
)

source=(https://files.pythonhosted.org/packages/40/4c/887ec101638f89d4f5e4c9c437d1411bcd61070df6a177cd37a93af90c7c/${_pkgname_us}-${pkgver}.tar.gz)
sha256sums=('bd5db0c05bb7fd973397922f70fc8371c7be2bb4911f9c38bd38c14ed7b52a2d')

check() {
  cd ${_pkgname_us}-${pkgver}
  awk 'FNR==3{print $2}' PKG-INFO
}

build() {
  cd ${_pkgname_us}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname_us}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/edge-tts/
}
