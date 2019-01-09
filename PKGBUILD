# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

_name=gtfparse
pkgbase='python-gtfparse'
pkgname=('python-gtfparse' 'python2-gtfparse')
pkgver=1.2.0
pkgrel=1
pkgdesc="Python library for parsing GTF files"
arch=('any')
url="https://pypi.python.org/pypi/gtfparse"
license=('Apache')
makedepends=('python' 'python-setuptools' 'python-pypandoc' 'python2' 'python2-setuptools' 'python2-pypandoc')
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/g/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2f27aa2b87eb43d613edabf27f9c11147dc595c8683b440ac1d88e9acdb85873')

prepare() {
  cp -a "${srcdir}/${_name}-${pkgver}"{,-py2}

  cd "${srcdir}/${_name}-${pkgver}-py2"
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
         -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      $(find . -name '*.py')
}

build(){
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py build
}

package_python2-gtfparse() {
  depends=('python2' 'python2-numpy' 'python2-pandas')

  cd "${srcdir}/${_name}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

package_python-gtfparse() {
  depends=('python' 'python-numpy' 'python-pandas')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
