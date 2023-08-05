# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=6.8.2
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL3)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-goocalendar: calendar support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('4a697850214f85517be980b0a47320d10c881a29d5835611e72e40cf2cd9f833e2cdd0987610432fb7c0ce3d4d4b2e951430ca821cee19fac30ebb93d8378a8d')
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
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png "${pkgdir}/usr/share/pixmaps/${_base}-icon.png"
}
