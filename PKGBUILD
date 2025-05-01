PACKAGER="Laurent Brock <incognito0135@protonmail.com>"

_pkgname=edge-tts
_pkgname_us="${_pkgname/-/_}" # Package name might have underscore in DL link
pkgname=python-${_pkgname}
pkgver=7.0.1
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

source=(https://github.com/rany2/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz)
sha256sums=('49483727d011625662369d5898ff3d981069a2a0ebd2b72fc89173159c680a1c')

check() {
  cd ${_pkgname}-${pkgver}
  test ${pkgver} = $(grep "__version__ =" ${srcdir}/${_pkgname}-${pkgver}/src/${_pkgname_us}/version.py | awk '{print $3}' | sed 's/"//g')
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
