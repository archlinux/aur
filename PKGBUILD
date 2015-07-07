# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-configparser
pkgver=3.3.0r2
pkgrel=1
pkgdesc="Brings the updated configparser from Python 3.2+ to Python 2.6-2.7"
arch=('any')
url="https://bitbucket.org/ambv/configparser"
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
options=(!libtool)
source=(https://pypi.python.org/packages/source/c/configparser/configparser-${pkgver}.tar.gz license)
md5sums=('dda0e6a43e9d8767b36d10f1e6770f09'
         'f8e5b03556ed846d7681bacd4126f484')

build() {
  cd "${srcdir}"/configparser-${pkgver}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/configparser-${pkgver}

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D "${srcdir}"/license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

