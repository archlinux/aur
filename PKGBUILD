# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-git
_pkgname=econnman
pkgver=1.21.5e344be
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface - Development version"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python2-efl-git' 'connman')
makedepends=('git')
provides=('econnman')
conflicts=('econnman' 'econnman-svn')
source=("git://git.enlightenment.org/apps/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  
  echo $(awk -F , '/^AC_INIT/ {print $2}' configure.ac | tr -d '[ ]').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
# Run with python2
  sed -i 's:/usr/bin/python:/usr/bin/python2:' "$srcdir/$_pkgname/econnman-bin.in"
}

build() {
  cd "$srcdir/$_pkgname"

  PYTHON=python2 \
  ./autogen.sh --prefix=/usr

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install
}
