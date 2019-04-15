# Maintainer: Chris Roth <(firstname).(lastname) @ usask.ca>

_pkgname=freetds
pkgname=${_pkgname}-krb5
pkgver=1.1.4
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
md5sums=('5433c7cf57fe399cc655029b7e21575b')

build() {
  cd ${_pkgname}-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/freetds --enable-msdblib \
    --with-tdsver=7.4 --with-unixodbc=/usr --with-openssl --enable-krb5
  make 
}

package() {
  cd ${_pkgname}-$pkgver
  make DESTDIR="$pkgdir" install
}
