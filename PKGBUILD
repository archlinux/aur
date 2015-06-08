# Maintainer: Jameson Pugh <imntreal@gmail.com>
pkgname=openzwave-svn
pkgver=r911
pkgrel=1
pkgdesc="Opensource Z-Wave control"
url="http://www.openzwave.com"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('libsystemd')
conflicts=('openzwave')
provides=('openzwave')
source=('openzwave-svn::svn+http://open-zwave.googlecode.com/svn/trunk/')
sha256sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}/${pkgname}
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/${pkgname} install
}

# vim:set ts=2 sw=2 et:@so
