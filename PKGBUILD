# maintainer : fenugrec
#todo: change to git:// url
pkgname=freediag-git
pkgver=20161108.463.446bb28
pkgrel=1
pkgdesc="OBD-II vehicle diagnostic software and (mostly) J1978 compliant scan tool."
arch=('i686' 'x86_64')
url="http://freediag.sourceforge.net/"
license=('GPL')
makedepends=('cmake' 'git')
depends=('glibc')
optdepends=('fltk: needed for scangui front-end')
provides=('freediag')
conflicts=('freediag')
source=('git+https://github.com/fenugrec/freediag')
sha256sums=('SKIP')

prepare () {
 cd $srcdir
 rm -rf ../builddir && mkdir ../builddir
}

pkgver () {
 _date=`date +"%Y%m%d"`
 cd $srcdir/freediag
 echo "$_date.$(git rev-list --count master).$(git rev-parse --short master)"
}

build() {
  cd $srcdir/../builddir
  cmake $srcdir/freediag -DCMAKE_INSTALL_PREFIX=/usr -DBUILDGUI=ON -DUSE_RCFILE=ON -DUSE_INIFILE=ON
  make
}

package () {
  cd $srcdir/../builddir
  make DESTDIR="$pkgdir" install
}

