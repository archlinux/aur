# Maintainer: Pieter Lenaerts <pieter.aj.lenaerts@gmail.com>
# Contributor: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.9999
pkgrel=1
pkgdesc="ODBC driver for SQLite"
arch=('i686' 'x86_64' 'aarch64')
depends=('unixodbc' 'sqlite' 'libxml2')
url="http://www.ch-werner.de/sqliteodbc/"
license=('BSD')
source=(http://www.ch-werner.de/sqliteodbc/${pkgname}-${pkgver}.tar.gz)
install=sqliteodbc.install

build() {
    cd "$srcdir/${pkgname}-$pkgver"

    # Autotools are from 2003. We have to autoreconf.
    rm aclocal.m4
    mv configure.in configure.ac
    aclocal
    libtoolize --force
    autoupdate --force
    autoreconf --force --install

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make -j1
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    install -d "${pkgdir}/usr/lib"
    make -j1 DESTDIR="${pkgdir}/" install
    install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('bbf5418e167b0e9595afccab079f4de0')
sha512sums=('ad5fcf9ef55bc4657669298c837dbea15e340660c0cd69df25d94919c6713803c0fe6ad55177cef3e6f7615174a7d5033d19c6d69307abb2e27a32932e4ff772')
