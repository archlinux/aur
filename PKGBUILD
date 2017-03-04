# Maintainer: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.16.1
pkgrel=1
pkgdesc="JDBC driver for SQLite"
arch=('any')
url="https://github.com/xerial/sqlite-jdbc"
license=('Apache')
depends=('java-environment')
makedepends=('java-environment' 'perl' 'maven' 'unzip')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('62ed46c5f00255716d60df15782a0999168387a02f5122b79b84a2e0c4842adc')

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
