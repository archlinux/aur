# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=mysql-connector-java
pkgver=8.2.0
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL,custom)
url='https://dev.mysql.com/downloads/connector/j/'
source=(
  https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-j-${pkgver}.tar.gz
#   mysql-connector-java-${pkgver}.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-connector-java-${pkgver}.tar.gz
)
# validpgpkeys=(A4A9406876FCBD3C456770C88C718D3B5072E1F5) # MySQL Release Engineering <mysql-build@oss.oracle.com>
sha512sums=('2e6af2e327094e1623133df5de4ff0f4bcb616c97661e3b4bab2a3a7e794f7a4655cb7077276a0a95ef252861aee1aaa3bd7677c0b3d9c0ab1c59732a3854135')

package() {
  cd "$srcdir/mysql-connector-j-${pkgver}"
  install -Dm644 mysql-connector-j-${pkgver}.jar \
    $pkgdir/usr/share/java/mysql-connector-j-${pkgver}.jar

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses"

  # Install symlink for not requiring a specific version
  cd "${pkgdir}/usr/share/java"
  ln -sf mysql-connector-j-${pkgver}.jar \
    mysql-connector-java.jar
  ln -sf mysql-connector-j-${pkgver}.jar \
    mysql-connector-j.jar
}
