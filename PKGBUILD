# Maintainer: Cedric Girard <girard.cedric@gmail.com>
# Contributor: Tom <tomgparchaur@gmail.com>
pkgname=cacti-spine
pkgver=0.8.7g
pkgrel=2
pkgdesc="Faster poller for Cacti."
arch=('i686' 'x86_64')
url="http://cacti.net/spine_info.php"
license=('GPL')
depends=('mysql' 'net-snmp' 'openssl')
backup=('etc/spine.conf')
makedepends=('binutils')
source=("http://www.cacti.net/downloads/spine/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  /usr/bin/aclocal
  /usr/bin/libtoolize --force --copy
  /usr/bin/autoheader
  /usr/bin/autoconf
  /usr/bin/automake --add-missing --copy --force-missing
  /bin/chmod +x ./configure
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  mv ${pkgdir}/usr/etc/ ${pkgdir}/
}

md5sums=('22c2b1986c880b9c587876c18d5c3f9f')
