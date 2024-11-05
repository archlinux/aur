PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
_pkgname_us="${_pkgname/-/_}" # Package name might have underscore in DL link
pkgname=python-${_pkgname}
pkgver=6.1.15
pkgrel=1
pkgdesc="Use Microsoft Edge's online text-to-speech service from within your Python code or using the provided edge-tts or edge-playback command"
arch=(any)
url=https://github.com/rany2/edge-tts
license=(GPL3)
depends=(python python-aiohttp python-yarl python-frozenlist python-async-timeout python-multidict python-charset-normalizer python-aiosignal python-attrs python-idna python-certifi)
makedepends=(
  python-setuptools
  python-build
  python-installer
  python-wheel
)
optdepends=(
	'mpv: immediate tts playback with the provided edge-playback command'
)

source=(https://files.pythonhosted.org/packages/51/b2/11cc81766f37a1fbf436bc5b334d2b831946c90f9e28f0b7d242075f12cb/${_pkgname_us}-${pkgver}.tar.gz)
sha256sums=('9e8c60cd30e83db379151736a4aaee0a2de6b999bc4e4b312ee7895dc987806d')

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
