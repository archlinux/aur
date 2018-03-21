# Maintainer: Chris Roth <(firstname).(lastname) @ usask.ca>

_pkgname=freetds
pkgname=${_pkgname}-krb5
pkgver=1.00.83
pkgrel=1
pkgdesc='Library for accessing Sybase and MS SQL Server databases with kerberos support.'
url='http://www.freetds.org'
arch=('x86_64')
license=('LGPL')
depends=('openssl' 'unixodbc' 'krb5')
conflicts=('freetds')
provides=('freetds')
backup=('etc/freetds/freetds.conf'
        'etc/freetds/locales.conf'
        'etc/freetds/pool.conf')
source=("ftp://ftp.freetds.org/pub/freetds/stable/${_pkgname}-$pkgver.tar.bz2")
sha256sums=('21505348f58742a2b283338f3c099f071f9d8dee7c450b59abd93478dfd43845')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/freetds --enable-msdblib \
    --with-tdsver=7.0 --with-unixodbc=/usr --with-openssl --enable-krb5
  make 
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
}
