# Contributor: Clint Valentine <valentine.clint@gmail.com>
_base=progressbar33
pkgname=python-${_base}
pkgver=2.4
pkgrel=3
pkgdesc="Text progress bar library for Python"
arch=(any)
url="https://github.com/germangh/python-${_base%33}"
license=('LGPL')
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4050d5e211f5ff80f3373aefe4ef8c79db534a540e49f00ad7d2d657032c291d6048ca320e22067707c0eda87b52f53e130c50c9faa2d282a1bdead66f27531f')

build() {
  cd ${pkgname%33}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${pkgname%33}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
