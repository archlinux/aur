PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.10
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

source=(https://files.pythonhosted.org/packages/09/65/0fea974d46cf18dc8b25cb1c8764c10f530e8922ffac2347b5e8b973c7ad/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('70a49f32ed766ea405b8d2a44ef124805349d296c1a56a220b0aff1e202f8891')

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
