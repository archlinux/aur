# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=0.8.8
pkgrel=1
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('libmysqlclient' 'net-snmp' "cacti=${pkgver}")
backup=('etc/spine.conf')
source=("http://www.cacti.net/downloads/spine/${pkgname}-${pkgver}.tar.gz")
md5sums=('af1b087e0b90a11ce4619e94dc3180e0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  /usr/bin/aclocal
  /usr/bin/libtoolize --force --copy
  /usr/bin/autoheader
  /usr/bin/autoconf
  /usr/bin/automake --add-missing --copy --force-missing
  /bin/chmod +x ./configure
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install 
  mv "${pkgdir}"/etc/spine.conf.dist "${pkgdir}"/etc/spine.conf
}

