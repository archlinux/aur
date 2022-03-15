# Contributor: Graziano Giuliani <graziano.giuliani@gmail.com>
_base=mipp
pkgname=python2-${_base}
pkgrel=1
pkgver=1.1.0
pkgdesc="Meteorological Ingest-Processing Package (MIPP)"
arch=(any)
url="https://github.com/pytroll/${_base}"
license=(LGPL3)
depends=(python2)
makedepends=(python2-setuptools)
source=(${url}/archive/v${pkgver}.tar.gz)
sha512sums=('89e91582aa62817aa747f25ccb8308cb84226236f418eece0e91315c87c48acf5d3493ad63ba2b5485bfa7842579e6ef0e996fbeb836fcff6e21a1e7fdb7e764')

prepare() {
  cd ${_base}-${pkgver}
  # We enforce this to be a strictly python2 package
  sed -i -e "s|^#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|^#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    -e "s|^#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
    $(find ${srcdir} -name '*.py')
}

build() {
  cd ${_base}-${pkgver}
  python2 setup.py build_ext --inplace
}

package() {
  cd ${_base}-${pkgver}
  python2 setup.py install --root="$pkgdir" --optimize=1
}
