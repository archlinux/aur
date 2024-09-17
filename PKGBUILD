# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=7.2.6
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
sha512sums=('f37a3316444867f70828c87efa0373163c40dab1db2359cc39b1da812e8224b6edc6d498a5e1bef2be6e38fcb7842ad442b3fd7968e55d510d821f1711fa4b87')
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
