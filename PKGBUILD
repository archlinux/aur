# Maintainer: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.9992
pkgrel=1
pkgdesc="ODBC driver for SQLite"
arch=('i686' 'x86_64')
depends=('sqlite')
url="http://www.ch-werner.de/sqliteodbc/"
license=('BSD')
source=(http://www.ch-werner.de/sqliteodbc/${pkgname}-${pkgver}.tar.gz)
md5sums=('383fee316c6f89bb63a6a4503b13b90b')
sha256sums=('f5c6119cfb688fc3d2fbc500c6cfa796538b767c511be5ab90fb6805fcd289c3')

build() {
    cd "$srcdir/${pkgname}-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
    make -j1
}

package() {
    cd "$srcdir/${pkgname}-$pkgver"
    install -d "${pkgdir}/usr/lib"
    make -j1 DESTDIR="${pkgdir}/" install
    install -D -m644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
