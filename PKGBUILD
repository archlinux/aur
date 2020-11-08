# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=1.2.15
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
sha256sums=('7a692b3eff3b836237eea12998f596e2b48941ef4364ca1c0e3e501e5cf8a865')


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
