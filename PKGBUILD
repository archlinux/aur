# Maintainer: Mike Redd <mredd@0tue0.com>
# Contributor: Mike Redd <mredd@0tue0.com>

pkgname=cmdln
_svntrunk=http://$pkgname.googlecode.com/svn/trunk/
_svnmod=$pkgname-read-only

pkgver=97
pkgrel=1.3
pkgdesc="a Python module for easily building good multi-command scripts (an improved cmd.py)"
arch=('i686' 'x86_64')
url="http://code.google.com/p/$pkgname/"
license="MIT"
depends=('python2')
makedepends=('subversion')
provides=('$pkgname')
source=()
md5sums=()


package() {
  cd $srcdir
  mkdir -p ~/.subversion
  svn co $_svntrunk -r $pkgver $_svnmod
  cd $_svnmod
  sed -i 's/python/python2/' Makefile.py
  sed -i 's/python/python2/' setup.py
  sed -i 's/python/python2/' toxbootstrap.py
  sed -i 's/pypi.python2.org/pypi.python.org/' toxbootstrap.py
  sed -i 's/python/python2/' bin/mkmanpage.py
  sed -i 's/python/python2/' docs/conan.py
  sed -i 's/python/python2/' examples/p4.py 
  sed -i 's/python/python2/' examples/svn.py
  sed -i 's/python/python2/' lib/$pkgname.py
  sed -i 's/python/python2/' sandbox/cmdtest/cmdtest.py
  sed -i 's/python/python2/' sandbox/cmdtest/ct.py
  sed -i 's/python/python2/' sandbox/cmdtest/test_helloworld.py
  python2 setup.py build
  python2 setup.py install --prefix=$pkgdir/usr
}
