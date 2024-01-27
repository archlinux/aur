# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Adrien Wu <adrien.sf.wu@gmail.com>

_distname=decorator
pkgname="python2-${_distname}"
pkgver=4.4.2
pkgrel=2
pkgdesc="Decorators for Humans (Python2 version)"
url="https://pypi.org/project/${_distname}/${pkgver}"
_repourl="https://github.com/micheles/${_distname}"
arch=('any')
license=('BSD-2-Clause')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${_repourl}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('97f4950d51502e5d02d3d7c818e7f47b06745ba7a05de29076c53f260c77b4f595ea33f7eaf01079df88f813a2a2081467ca2ff65d72bf7659eec6045040f544')

build() {
  cd "${srcdir}/${_distname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_distname}-${pkgver}"
  PYTHONPATH="$(pwd)/build/lib" python2 setup.py test -v
}

package() {
  cd "${srcdir}/${_distname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  install -v -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
