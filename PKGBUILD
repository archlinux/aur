# Maintainer: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.15.1
pkgrel=1
pkgdesc="JDBC driver for SQLite"
arch=('any')
url="https://github.com/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-environment')
makedepends=('java-environment' 'perl' 'maven' 'unzip')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('35ed8e6dccdcf97735c9e5bef1c4842f4ac8ee781a8fb67258a367072c1a233a')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  export JAVA_HOME=/usr/lib/jvm/default
  mvn package
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/target"

  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}
