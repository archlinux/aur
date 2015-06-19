# Contributor: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=python-pydde
pkgver=0.2.2
pkgrel=1
pkgdesc="A solver for delay differential equations written in Python and C."
arch=('i686' 'x86_64')
url="http://users.ox.ac.uk/~clme1073/python/PyDDE/"
license=('GPL')
depends=('python-numpy')
makedepends=('setuptools' 'python-numpy')
source=(http://users.ox.ac.uk/~clme1073/python/PyDDE/PyDDE-${pkgver}.tar.gz)
md5sums=('275eb5f15fb7124f06fef17655f63c12')

build() {
   cd ${srcdir}/PyDDE-${pkgver}
   ln -s /usr/lib/python2.7/site-packages/numpy/core/include/numpy/ PyDDE/src/numpy
   sed -i 's#<numpy/arrayobject.h>#"numpy/arrayobject.h"#' PyDDE/src/wrapper.c
   sed -i 's/extra_compile_args=\[""\]/extra_compile_args=["-I."]/' setup.py
   python2 setup.py install --prefix=/usr --root=${pkgdir} || return 1
}
