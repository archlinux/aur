# $Id: PKGBUILD 280656 2016-11-14 07:40:20Z bpiotrowski $
# Maintainer: Erik Johnson <palehose at gmail dot com>

_realname=freetds
pkgname=${_realname}-patched-enum
pkgver=1.1.42
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
sha256sums=('aff70ecdef357b278d117273aab59d63c08a38418794d4fd428eec8fd0b4f00a'
            'fdbe80579cc50e90dee4851ddf4f7707e08f56d23f3381615b21f0e87baaf219')

build() {
  cd $_realname-$pkgver
  patch -Np1 -i $srcdir/enum.patch
  ./configure --prefix=/usr --sysconfdir=/etc/freetds --enable-msdblib \
    --with-tdsver=7.4 --with-unixodbc=/usr --with-openssl
  make
}

package() {
  cd $_realname-$pkgver
  make DESTDIR="$pkgdir" install
}
