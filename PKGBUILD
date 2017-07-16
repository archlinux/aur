# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Vitaliy Berdinskikh <ur6lad at archlinux.org.ua>
pkgname=mysql-jdbc
pkgver=5.1.42
_fullname=mysql-connector-java-${pkgver}
pkgrel=1
pkgdesc='The official JDBC driver for MySQL'
arch=('any')
url='https://dev.mysql.com/downloads/connector/j/'
license=('GPL2')
depends=('java-runtime')
install=mysql-jdbc.install
source=("https://cdn.mysql.com/Downloads/Connector-J/${_fullname}.tar.gz"{,.asc})
noextract=(${_fullname}.tar.gz)
validpgpkeys=('A4A9406876FCBD3C456770C88C718D3B5072E1F5')
md5sums=('bc23a03d813af3f7ac44b8e7a5cb0d54'
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
	install -m 644 {CHANGES,README,docs/connector-j.*} "$pkgdir"/usr/share/doc/$pkgname
}
