# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Duell <dev _at_ akurei _._ me>
# Contributor: Jian Zeng <anonymousknight96 at gmail dot com>
_base=telegram-send
pkgname=python-${_base}
pkgdesc="Send messages and files over Telegram from the command-line"
pkgver=0.37
pkgrel=1
arch=(any)
url="https://github.com/rahiel/${_base}"
license=(GPL3)
depends=(python-telegram-bot python-colorama python-appdirs)
makedepends=(python-build python-installer python-setuptools python-wheel)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha256sums=(
  '9f69abb331598e4b6ba8a173b15df7dfdec4eec17e3600a43d554c53b0150695'
)


build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
