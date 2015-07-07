# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Luis Miguel García-Cuevas González <luismiguelgcg@gmail.com>  

pkgname=python2-uncertainties
pkgver=2.4.6.1
pkgrel=1
pkgdesc="Transparent calculations with uncertainties on the quantities involved (aka 'error propagation'); fast calculation of derivatives"
arch=('any')
license=('BSD')
url="http://packages.python.org/uncertainties/"
depends=('python2')
optdepends=('python2-numpy: additional support for NumPy arrays and matrices')
makedepends=('python2-setuptools')
source=(http://pypi.python.org/packages/source/u/uncertainties/uncertainties-${pkgver}.tar.gz)
md5sums=('a30c01fda82b07ceb758e47e4768843f')

prepare() {
  cd "${srcdir}/uncertainties-${pkgver}"

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${srcdir}" -name '*.py')
}

build() {
  cd "${srcdir}/uncertainties-${pkgver}"

  python2 setup.py build
}

package() {
  cd "${srcdir}/uncertainties-${pkgver}"

  python2 setup.py install --prefix=/usr --root="${pkgdir}"

  install -D LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
