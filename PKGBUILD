# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jean Lucas <jean@4ray.co>
_base=pandas-summary
pkgname=python-${_base}
pkgver=0.1.0
pkgrel=1
pkgdesc="An extension to pandas describe function"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(MIT)
depends=(python-pandas)
# makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('56dd74f53ab6d8838e38ab923551804217defe7a2dc6a9235dce15ec4bf6e7085f8a3805b731d1d558b66ff774aaeb625bd2ee6656b12ad91017a260f1e35d0f')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
