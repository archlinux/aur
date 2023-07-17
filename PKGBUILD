# Maintainer: Laurent Brock <incognito0135@protonmail.com>

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.7
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

source=(https://files.pythonhosted.org/packages/b9/59/8e1f258ec296a8c3905de7910da3313570e86ce3efa4aa5c6cc555e93032/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('7bad94e0082261817f6fc69764a91b84757dd0d60ecbca2f5cea02b1a474ed27')

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
