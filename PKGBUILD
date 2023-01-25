# Maintainer: Laurent Brock <incognito0135@protonmail.com>

_pkgname=edge-tts
pkgname=python-${_pkgname}
pkgver=6.1.3
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

source=(https://files.pythonhosted.org/packages/84/2c/5a6f5d2a5f2cd393533eeab239177c1ce4f5c05b36de4048e2281e3d1c57/edge-tts-${pkgver}.tar.gz)
sha256sums=('4eb0e782626d06211256c726e42e4e42c3315c0f4fee2fc2394763b1aa8a80e7')

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
