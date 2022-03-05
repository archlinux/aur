# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
_base=NiaPy
pkgname=python-${_base,,}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python microframework for building nature-inspired algorithms"
url="https://${_base}.org"
arch=(any)
license=(MIT)
depends=(python-pandas python-matplotlib python-openpyxl)
checkdepends=(python-pytest)
source=(https://github.com/NiaOrg/${_base}/archive/${pkgver}.tar.gz)
sha512sums=('7c2233e24bfeebad277f44897bc4763d55de514693f84bfcc06b325f6b7adb06e8a7668df58e9a6c2350a51f6d8145afff5081841e8f9c5f1d0dc38be4e96653')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
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
