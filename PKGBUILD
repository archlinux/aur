# Maintainer: Laurent Brock <incognito0135@protonmail.com>

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.2
pkgrel=1
pkgdesc="Use Microsoft Edge's online text-to-speech service from within your Python code or using the provided edge-tts or edge-playback command"
arch=(any)
url=https://github.com/rany2/edge-tts
license=(GPL3)
depends=(python python-aiohttp python-yarl python-frozenlist python-async-timeout python-multidict python-charset-normalizer python-aiosignal python-attrs python-idna)
makedepends=(
  git
  python-setuptools
)
optdepends=(
	'mpv: immediate tts playback with provided edge-playback tool'
)

source=(https://files.pythonhosted.org/packages/e7/85/dea779e3dc4ee1902f865cef8f3395d39ee9a6b015eac3be060a9d936f7f/edge-tts-${pkgver}.tar.gz)
sha256sums=('833560bf8ad6a4d1985dbad57fe86ece9cb875c51231cec0e665507dde4fd16a')

pkgver() {
  cd edge-tts-${pkgver}
  awk 'FNR==3{print $2}' PKG-INFO
}

build() {
  cd edge-tts-${pkgver}
  python setup.py build
}

package() {
  cd edge-tts-${pkgver}
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/edge-tts/
}
