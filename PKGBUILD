#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-polygon
pkgver=2.0.7
pkgrel=1
pkgdesc="Python package that handles polygonal shapes in 2D"
arch=('i686' 'x86_64')
url="http://www.j-raedler.de/projects/polygon/"
depends=('python2-numpy')
makedepends=('unzip')
license=('LGPL')
options=(!libtool)
source=(https://bitbucket.org/jraedler/polygon2/downloads/Polygon2-${pkgver}.zip)
md5sums=('a6fa2806d75aa6e7da87f9b1b2332ecd')

build() {
    cd "$srcdir"/Polygon2-$pkgver
    export CFLAGS+=" -I/`python2 -c 'from distutils.sysconfig import get_python_lib; \
	    print get_python_lib()'`/numpy/core/include/"
    export PYTHON="`which python2`"
    python2 setup.py build
}

package() {
    cd "$srcdir"/Polygon2-$pkgver
    python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

