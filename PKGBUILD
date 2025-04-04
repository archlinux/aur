# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=7.4.7
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL-3.0-or-later)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-goocalendar: calendar support'
  'python-playsound: sound support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('bb401944b7a17b23e216a4222140363a3fc4fd45a06f84c39d30fae69d8c1075939a558e8b0488c024dacbabcc2fbc8c72250c095fa6095c2b95360a76913b67')
provides=(${_base})
conflicts=(${_base})

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png -t "${pkgdir}/usr/share/pixmaps"
}
