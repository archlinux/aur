# Maintainer: willemw <willemw12@gmail.com>

_pkgname=kakawana
pkgname=$_pkgname-svn
pkgver=r212
pkgrel=2
pkgdesc="RSS reader specialized for comics"
arch=('any')
url="http://kakawana.googlecode.com/"
makedepends=('python2-setuptools' 'subversion')
depends=('pyqt' 'python2-sqlalchemy-0.7.9' 'python2-beautifulsoup4' 'python2-elixir' 
         'python2-httplib2' 'python2-keyring' 'python2-lxml' 'python2-oauth2')    #python2-beautifulsoup3
license=('GPL2')
conflicts=($_pkgname)
provides=($_pkgname)
source=($pkgname::svn+http://kakawana.googlecode.com/svn/trunk/)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname/src/kakawana"
  sh ./build.sh
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # Patch
  cd "$srcdir/$pkgname/src/kakawana"
  cp -r *.ui icons/ images/ templates/ "$pkgdir/usr/lib/python2.7/site-packages/kakawana/"
}

