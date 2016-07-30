#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-polygon
pkgver=2.0.8
_tag=9917e23dc99a
pkgrel=1
pkgdesc="Python package that handles polygonal shapes in 2D"
arch=('i686' 'x86_64')
url="http://www.j-raedler.de/projects/polygon/"
depends=('python2-numpy')
makedepends=('unzip')
license=('LGPL')
options=(!libtool)
source=("https://bitbucket.org/jraedler/polygon2/get/${pkgver}.tar.bz2")
md5sums=('aa38365caea6df849c923ef703f1fafc')

build() {
    cd "$srcdir"/jraedler-polygon2-${_tag}
    export CFLAGS+=" -I/`python2 -c 'from distutils.sysconfig import get_python_lib; \
      print get_python_lib()'`/numpy/core/include/"
    export PYTHON="`which python2`"
    python2 setup.py build
}

package() {
    cd "$srcdir"/jraedler-polygon2-${_tag}
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

