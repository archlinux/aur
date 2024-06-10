# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=1.2.27
pkgrel=1
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('libmariadbclient' 'net-snmp' "cacti>=${pkgver}")
makedepends=('help2man')
options=('!makeflags')
backup=('etc/spine.conf')
source=( "http://www.cacti.net/downloads/spine/${pkgname}-${pkgver/_/}.tar.gz")
sha256sums=('c7c0373f4d3ec72e63faa389ba6def156eb9806eb3a3224bec314e3cca74c5c0')


build() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"
  mkdir -p m4
  autoreconf --force --install
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver/_/}"
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}"/etc/spine.conf.dist "${pkgdir}"/etc/spine.conf
}
