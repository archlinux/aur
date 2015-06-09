pkgname=kvirc4-svn
pkgver=6381
pkgrel=1
pkgdesc="Qt4 based IRC-Client, compiled with kde4 support - SVN Version"
arch=('i686' 'x86_64')
url="http://www.kvirc.net"
license=('GPL')
depends=('qt4' 'glibc' 'openssl' 'zlib' 'kdelibs' 'perl')
makedepends=('cmake' 'subversion' 'automoc4' 'gettext')
conflicts=('kvirc4' 'kvirc')
provides=('kvirc' 'kvirc4')
source=("svn+https://svn.kvirc.de/svn/trunk/kvirc")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/kvirc"
  svnversion | tr -d [A-z]
}

build() {
  cd "$srcdir/kvirc"
  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" -DWANT_QT4=1
  make
}

package() {
  cd "$srcdir/kvirc"
  make DESTDIR="$pkgdir" install
}
