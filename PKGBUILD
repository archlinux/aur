# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=Vapory
pkgname=python-${_base/V/v}
pkgdesc="Photo-realistic 3D rendering with Python and POV-Ray"
pkgver=0.1.2
pkgrel=2
arch=('any')
url="https://github.com/Zulko/${_base}"
depends=(povray python)
makedepends=(python-setuptools)
license=(MIT)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f72ba31880afa892a20669f6a4e68f90aec2036e296c477181d94f059b8cf2d3e2ad4d0b339746779bd823a4514f5722023fce10afaad8d98d1acac3fdff57d6')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
