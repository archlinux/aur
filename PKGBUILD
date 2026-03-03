# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=7.8.4
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
sha512sums=('a842c4fa0908373487fdae5edbf746464b66603b9004e4d707dfea3a83a568153c6a141a68d349e65087e6a63ca569249788ec18bb6b3a8b47d5f7df1a9a75f5')
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
