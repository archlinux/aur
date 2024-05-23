PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.12
pkgrel=2
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

source=(https://files.pythonhosted.org/packages/f0/9e/c41177598e2cc6a9a7913d577098bcf3d4ab71d4b797b89b7343d1789e12/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('cfb71806f829eebd579aa5f61c3426126a2c84e60ac7da4cf014c678894ac1fd')

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
