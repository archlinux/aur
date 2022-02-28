# Contributor: Sergey Mastykov <smastykov[at]gmail[dot]com>
_base=pytils
pkgname=python-${_base}
pkgdesc="Russian-specific string utils"
pkgver=0.4.1
pkgrel=1
arch=(any)
url="https://pypi.python.org/pypi/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('c309251fded7a8ed9812dfbcd5f1cf2979f1be891e66fe7a451f99f606cfbcf3acd19d14e1e252a45114d3a5d034a8d3b7ac8f9837dd70f599eb6a7b89d36e9a')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
