# Contributor: Jameson Pugh <imntreal@gmail.com>
_base=wifi
pkgname=python-${_base}wrapper
pkgver=0.3.8
pkgrel=1
pkgdesc="Command line tool and library wrappers around iwlist and /etc/network/interfaces"
arch=(any)
url="https://pypi.python.org/pypi/wifi"
license=('custom')
depends=(python)
makedepends=(python-setuptools)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('649b9ca85fababa8275b4c03ce229d474da8a89c19e1467b9e3a5a7be2e2a975c142a7851226c3285d3d071ee1688adafbe835efd4f9bcd2295309b9e039da81')

build() {
  cd wifi-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd wifi-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
