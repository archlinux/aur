# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-golem
pkgver=1.0.1
pkgrel=1
pkgdesc="Ontology language and toolkit for semantic processing of scientific data"
url="http://www.lexical.org.uk/science/golem/"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
license=('MIT')
options=(!libtool)
source=("http://pygolem.googlecode.com/files/golem-${pkgver}.tar.gz")
noextract=("golem-${pkgver}.tar.gz")
md5sums=('cae7dbcbcf3d0cc81cc89e111b54665f')

prepare() {
  cd "${srcdir}"
  rm -rf golem-$pkgver
  mkdir golem-$pkgver
  cd golem-$pkgver
  tar -xzf ../golem-${pkgver}.tar.gz
}

build() {
  cd "${srcdir}"/golem-$pkgver

  python2 setup.py build
}

package() {
  cd "${srcdir}"/golem-$pkgver

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${pkgdir}" -name '*.py')

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

