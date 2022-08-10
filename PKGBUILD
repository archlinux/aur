# Maintainer: Chris Roth <(firstname) @ preteckt.com>

_pkgname=freetds
pkgname=${_pkgname}-krb5
pkgver=1.3.12
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
source=("ftp://ftp.freetds.org/pub/freetds/stable/${_pkgname}-$pkgver.tar.gz")
md5sums=('26fd85c844d42f2d87998b46abbd5015')

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
