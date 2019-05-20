# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=mysql-connector-java
pkgver=8.0.16
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL,custom)
url="http://www.mysql.com/downloads/connector/j/"
source=(
  http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz
  mysql-connector-java-${pkgver}.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-connector-java-${pkgver}.tar.gz
)
validpgpkeys=(A4A9406876FCBD3C456770C88C718D3B5072E1F5) # MySQL Release Engineering <mysql-build@oss.oracle.com>
sha512sums=('9baa01de68796a3db9758db39b415117dd716ee57999d74314d56fdd8f02fd9a5443af8733e3eacbc95b471ff83e36931976b2624a75fa7bb8461eb8163ef5b2'
            'SKIP')

package() {
  cd "$srcdir/mysql-connector-java-${pkgver}"
  install -Dm644 mysql-connector-java-${pkgver}.jar \
    $pkgdir/usr/share/java/mysql-connector-java-${pkgver}.jar

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses"

  # Install symlink for not requiring a specific version
  cd "${pkgdir}/usr/share/java"
  ln -sf mysql-connector-java-${pkgver}.jar \
    mysql-connector-java.jar
}
