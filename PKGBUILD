# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Vitaliy Berdinskikh <ur6lad at archlinux.org.ua>
pkgname=mysql-jdbc
pkgver=5.1.45
_fullname=mysql-connector-java-${pkgver}
pkgrel=2
pkgdesc='The official JDBC driver for MySQL'
arch=('any')
url='https://dev.mysql.com/downloads/connector/j/'
license=('GPL2')
depends=('java-runtime')
install=mysql-jdbc.install
source=("https://cdn.mysql.com/Downloads/Connector-J/${_fullname}.tar.gz"{,.asc})
noextract=(${_fullname}.tar.gz)
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
md5sums=('ab9ac454a959859a297b53bdbf156f3c'
         'SKIP')
sha256sums=('1d289a056c7eb8290108a8d2e3c4717193662a9171adb56cfa3b769b32de3300'
            'SKIP')

prepare() {
	cd "$srcdir"

	tar -xf ${_fullname}.tar.gz --strip-components=1
}

package() {
	cd "$srcdir"

	install -d "$pkgdir"/usr/share/java/$pkgname
	install -m 644 ${_fullname}-bin.jar "$pkgdir"/usr/share/java/$pkgname/${_fullname}-bin.jar
	ln -s ${_fullname}-bin.jar "$pkgdir"/usr/share/java/$pkgname/mysql-connector-java-bin.jar

	install -d "$pkgdir"/usr/share/doc/$pkgname
	install -m 644 {CHANGES,README} "$pkgdir"/usr/share/doc/$pkgname
}
