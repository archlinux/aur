# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>
# Contributor: barchiesi <dlbarchiesi at gmail dot com>
# Contributor: Sebastien Bariteau <numkem@gmail.com>

pkgname=mysql-connector-java
pkgver=8.0.13
pkgrel=1
pkgdesc="Java library to connect to MySQL"
depends=(java-environment)
arch=(any)
license=(GPL,custom)
url="http://www.mysql.com/downloads/connector/j/"
source=(
  http://dev.mysql.com/Downloads/Connector-J/mysql-connector-java-${pkgver}.tar.gz
  mysql-connector-java-${pkgver}.tar.gz.asc::https://dev.mysql.com/downloads/gpg/?file=mysql-connector-java-${pkgve}.tar.gz
)
validpgpkeys=(A4A9406876FCBD3C456770C88C718D3B5072E1F5) # MySQL Release Engineering <mysql-build@oss.oracle.com>
sha512sums=('0f56d20168a692316a077f99349c4b98e51be2e9743aa970633a4c51ade83da7ab94d4547baf6dd8b9746211e9649c744df62ad439f868b029e4d860c8501083'
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
