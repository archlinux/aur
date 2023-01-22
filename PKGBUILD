# Maintainer: Laurent Brock <incognito0135@protonmail.com>

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.1
pkgrel=2
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

source=(https://files.pythonhosted.org/packages/84/c9/81a7961004234a8b142879d93205ec1eba4acd6557e79a4deb3e661d7fb0/edge-tts-${pkgver}.tar.gz)
sha256sums=('ccbebf95553ac10b0badd3000e8590278f2d152f3aacff9845c8cca32058870b')

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
