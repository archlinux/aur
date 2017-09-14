# Maintainer: David Baer <david.a.baer@gmail.com>

pkgname=sqliteodbc
pkgver=0.9995
pkgrel=2
pkgdesc="ODBC driver for SQLite"
arch=('i686' 'x86_64')
depends=('sqlite')
url="http://www.ch-werner.de/sqliteodbc/"
license=('BSD')
source=(http://www.ch-werner.de/sqliteodbc/${pkgname}-${pkgver}.tar.gz)
md5sums=('109ce39360c6dc46c3688a3df3c6cd01')
sha256sums=('73deed973ff525195a225699e9a8a24eb42f8242f49871ef196168a5600a1acb')
install=sqliteodbc.install

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
