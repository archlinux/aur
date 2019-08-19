# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Philipp Schmitt <philipp@schmitt.co>

pkgname=python2-backports.lzma
pkgver=0.0.13
pkgrel=1
pkgdesc="Backport of Python 3.3's 'lzma' module for XZ/LZMA compressed files."
arch=('x86_64')
url="https://github.com/peterjc/backports.lzma"
license=('BSD')
depends=('python2-backports' 'xz')
makedepends=('python2-setuptools')
source=("https://pypi.io/packages/source/b/backports.lzma/backports.lzma-${pkgver}.tar.gz")
md5sums=('b9f7d8e17729090adba6cac3f7d348aa')

prepare() {
  cd "${srcdir}"/backports.lzma-$pkgver

  sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find "${srcdir}" -name '*.py')
}

build() {
  cd "${srcdir}"/backports.lzma-$pkgver

  python2 setup.py build
}

package() {
  cd "${srcdir}"/backports.lzma-$pkgver

  python2 setup.py install --skip-build --prefix=/usr --root="${pkgdir}" --optimize=1

  # in python2-backports  
  rm "$pkgdir/usr/lib/python2.7/site-packages/backports/__init__.py"*

  install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

