# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.0.2
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib python-openpyxl)
checkdepends=(python-pytest)
source=(https://github.com/NiaOrg/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('d13fe766aa4e1d3150be07845d2fcfa856b6ffd66d70e9a8de187325da3c702f266a1b65ee817879e344d3b6302c12deac8e8f6550699b01c9df900d82be0644')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

check() {
  cd ${_base}-${pkgver}
  python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
