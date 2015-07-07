# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pydicom
pkgver=0.9.9
pkgrel=1
pkgdesc="Pure python package for working with DICOM files"
arch=('any')
url="http://www.pydicom.org/"
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
options=(!emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/darcymason/pydicom/archive/v${pkgver}.tar.gz"
        license.txt)
md5sums=('2248b21c63d220d16d32dd98a79f352c'
         '12e0f408817638d2f759a59d968858ae')

prepare() {
  cd "$srcdir/pydicom-$pkgver/source"

  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    $(find -name '*.py')
}

build() {
  cd "$srcdir/pydicom-$pkgver/source"

  python2 setup.py build
}

package() {
  cd "$srcdir/pydicom-$pkgver/source"

  python2 setup.py install --root="$pkgdir"/ --optimize=1

  install -D "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

