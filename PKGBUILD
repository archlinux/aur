# Maintainer: Laurent Brock <incognito0135@protonmail.com>

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.5
pkgrel=5
pkgdesc="Use Microsoft Edge's online text-to-speech service from within your Python code or using the provided edge-tts or edge-playback command"
arch=(any)
url=https://github.com/rany2/edge-tts
license=(GPL3)
depends=(python python-aiohttp python-yarl python-frozenlist python-async-timeout python-multidict python-charset-normalizer python-aiosignal python-attrs python-idna python-build python-installer python-wheel)
makedepends=(
  git
  python-setuptools
)
optdepends=(
	'mpv: immediate tts playback with the provided edge-playback command'
)

source=(https://files.pythonhosted.org/packages/57/9b/c210806c9179e366254840014cd339e8f84453d7d562c9c9299635ecd043/edge-tts-${pkgver}.tar.gz)
sha256sums=('20b2a561989203bc7dbc63434da4b2078453e7d8cb068e51c39b446de22431c0')

pkgver() {
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
