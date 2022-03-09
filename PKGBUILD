# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Fredrick Brennan <copypaste@kittens.ph>
# Contributor: mutantmonkey <aur@mutantmonkey.in>
# Contributor: Stephan Eisvogel <eisvogel at embinet dot de>
_base=ruffus
pkgname=python-${_base}
pkgver=2.8.4
pkgrel=1
pkgdesc="A lightweight Python library for computational pipelines."
arch=(any)
url="http://www.${_base}.org.uk"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5f38ad4ca5aca007e63b59be6117af85618bc27e8d98cc3b32add82ac48766c37b3fb2633a28c98941397ab3154553ba57509b321d2c80d01c753ac189f092e7')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
