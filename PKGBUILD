# Contributor: noonov <noonov@gmail.com>

_pkgname=jd
pkgname=${_pkgname}-svn
pkgver=r4212
pkgrel=1
pkgdesc="A 2channel browser written in C++ using gtkmm"
arch=('i686' 'x86_64')
url="http://jd4linux.sourceforge.jp/"
license=('GPL2')
depends=('gnutls' 'libsm' 'gtkmm')
makedepends=('subversion')
provides=('jd')
conflicts=('jd')
source=("${_pkgname}::svn+http://svn.sourceforge.jp/svnroot/jd4linux/jd/trunk")
md5sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
  cd ${SRCDEST}/${_pkgname}
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}/${_pkgname}

  autoreconf -i
  ./configure --prefix=/usr
  make CXXFLAGS+="-std=c++11"
}

package() {
  cd ${srcdir}/${_pkgname}

  make DESTDIR=${pkgdir} install
}
