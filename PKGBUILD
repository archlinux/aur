# Maintainer: Pablo Lluch <pablo dot lluch at gmail dot com>
# Contributor: Chad Voegele

pkgname=python-spams-svn
pkgver=20160424
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL3')
pkgdesc="Optimization toolbox for solving various sparse estimation problems
with Python interface"
url="http://spams-devel.gforge.inria.fr/"
depends=('python-scipy')
makedepends=('swig')
source=("python-spams.patch"
        "svn+svn://scm.gforge.inria.fr/svnroot/spams-devel/trunk")

md5sums=('4d3ea03f84ff1878d8c19d79e7149fb7'
         'SKIP')

build() {
  cd $srcdir
  patch -p0 -i python-spams.patch
  cd $srcdir/trunk/swig/python
  ./mkpy spams
  python setup.py.in build
}

package() {
  cd $srcdir/trunk/swig/python
  mkdir -p $pkgdir/usr
  python setup.py.in install --root=$pkgdir --optimize=1 --prefix=/usr
}
