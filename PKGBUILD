# Maintainer: Jan Stephan <jan.stephan.dd@gmail.com>

pkgname=lib32-freetds
_basename=freetds
pkgver=1.00.44
pkgrel=1
pkgdesc='Library for accessing Sybase and MS SQL Server databases (32-bit)'
url='http://www.freetds.org'
arch=('x86_64')
license=('LGPL')
depends=('lib32-openssl' 'lib32-unixodbc' 'freetds')
source=("ftp://ftp.freetds.org/pub/freetds/stable/$_basename-$pkgver.tar.bz2")
sha256sums=('7fb252f84651816abb1663ce4c5b4b8ae077e8f1e30bde43be4eb776182764b5')

build() {
  export CC='cc -m32'
  export CXX='c++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_basename-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc/freetds --enable-msdblib \
    --with-tdsver=7.0 --with-unixodbc=/usr --with-openssl --build=i686-pc-linux-gnu --libdir=/usr/lib32
  make 
}

package() {
  cd $_basename-$pkgver
  make DESTDIR="$pkgdir" install

  rm -rf "${pkgdir}"/etc
  rm -rf "${pkgdir}"/usr/bin
  rm -rf "${pkgdir}"/usr/include
  rm -rf "${pkgdir}"/usr/share
}
