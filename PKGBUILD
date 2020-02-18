# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Li Ruibo <lymanrb@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux-br.org>
# Contributor: Rick Rein <jeebusroxors@gmail.com>

pkgname=psqlodbc
pkgver=12.01.0000
pkgrel=1
pkgdesc="PostgreSQL ODBC driver"
arch=('x86_64')
license=('GPL')
url="http://www.postgresql.org"
depends=('unixodbc' 'postgresql-libs')
makedepends=('postgresql')
install=psqlodbc.install
source=(https://ftp.postgresql.org/pub/odbc/versions/src/psqlodbc-$pkgver.tar.gz)
sha256sums=('fdbb3edfcc9730787bb84d76e61fcf7584ced1913d7bfccea0bcbf5a150a5f74')

build() {
  cd "$srcdir/$pkgname-$pkgver"
#  sed -i 's|#define DEFAULT_PGSOCKET_DIR.*|#define DEFAULT_PGSOCKET_DIR "/run/postgresql"|' socket.h
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
