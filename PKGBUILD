# $Id: PKGBUILD 280656 2016-11-14 07:40:20Z bpiotrowski $
# Maintainer: Erik Johnson <palehose at gmail dot com>

_realname=freetds
pkgname=${_realname}-patched-enum
pkgver=1.00.15
pkgrel=1
pkgdesc='Library for accessing Sybase and MS SQL Server databases, patched to replace removed enum needed by some applications'
url='http://www.freetds.org'
arch=('i686' 'x86_64')
license=('LGPL')
depends=('openssl' 'unixodbc')
conflicts=('freetds')
provides=('freetds')
backup=('etc/freetds/freetds.conf'
        'etc/freetds/locales.conf'
        'etc/freetds/pool.conf')
source=("ftp://ftp.freetds.org/pub/freetds/stable/$_realname-$pkgver.tar.bz2"
        'enum.patch')
md5sums=('b57988e84937b7f285ec9d20528c9b5e'
         'eb1d2fb15b88471865b734e378f7b90e')

build() {
  cd $_realname-$pkgver
  patch -Np1 -i $srcdir/enum.patch
  ./configure --prefix=/usr --sysconfdir=/etc/freetds --enable-msdblib \
    --with-tdsver=7.0 --with-unixodbc=/usr --with-openssl
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
