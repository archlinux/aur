PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.9
pkgrel=1
pkgdesc="Use Microsoft Edge's online text-to-speech service from within your Python code or using the provided edge-tts or edge-playback command"
arch=(any)
url=https://github.com/rany2/edge-tts
license=(GPL3)
depends=(python python-aiohttp python-yarl python-frozenlist python-async-timeout python-multidict python-charset-normalizer python-aiosignal python-attrs python-idna)
makedepends=(
  python-setuptools
  python-build
  python-installer
  python-wheel
)
optdepends=(
	'mpv: immediate tts playback with the provided edge-playback command'
)

source=(https://files.pythonhosted.org/packages/36/b4/5308be645ae5d5952c6ac169ec07e1e34a2de69d9f19ed5cfeef5f71b6cd/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('296c05a0f96fbc26c226ad266266ccb494ed2ce1c5bb27d4d99356506623ca36')

check() {
  cd ${_pkgname}-${pkgver}
  awk 'FNR==3{print $2}' PKG-INFO
}

build() {
  cd ${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${_pkgname}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/edge-tts/
}
