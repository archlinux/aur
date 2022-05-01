# Maintainer: chisbread <chisbread@gmail.com>

pkgname=transmission-pt-edition
pkgver=r12
pkgrel=2
pkgdesc="transmission web server with fast hash check, and smart auto recheck"
arch=(x86_64)
url='https://github.com/ChisBread/transmission_pt_edition'
license=(GPL)
depends=(curl libevent)
makedepends=(curl libevent)
source=("https://github.com/ChisBread/transmission_pt_edition/releases/download/3.0-${pkgver}/SourceWithSubmodules.tar.gz")
sha256sums=('e4fe322004ba16cd49ad42f6af45b173ebb5c41a4456d21e8752dbfb09525d67')

#prepare() {
#}

build() {
  cd ./transmission_pt_edition-3.0-$pkgver
  HAVE_CXX=yes ./configure --disable-nls --enable-daemon --enable-utp --without-gtk --disable-dependency-tracking --prefix=/usr
  make
}
DAEMON_SERVICE=
package() {
  cd ./transmission_pt_edition-3.0-$pkgver
  make DESTDIR="${pkgdir}" install
  cp -r third-party/transmission-web-control/src/* ${pkgdir}/usr/share/transmission/web
}
