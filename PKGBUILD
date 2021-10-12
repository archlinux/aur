# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=viscm
pkgname=python-${_base}
pkgdesc="A tool for visualizing and designing colormaps using colorspacious and matplotlib"
pkgver=0.9
pkgrel=3
arch=('any')
url="https://github.com/matplotlib/${_base}"
license=(MIT)
depends=(python-matplotlib python-colorspacious)
makedepends=(python-setuptools)
checkdepends=(python-pyqt5 python-scipy)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('aa352f12c243f9940297dc2799e1ad1e649f8bfc0c3a5bb772f351ec0d3c380619382da847e090c1191840036a3f06ccf552658c59ce2296f576e5213884e334')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python tests.py
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
