# Maintainer: Witalij Berdinskich radio_rogal[at]keemail.me
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.41.0.1
pkgrel=1
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('a018d1afd00f7678c6f8cbb964accbb01f601c02b81d63e5496e13bc19f26734')

prepare() {
  ln -s ${pkgname}-${pkgver} ${pkgname}
  # remove unused sqlite binaries
  cd ${pkgname}/src/main/resources/org/sqlite/native
  find . ! -path "./Linux/$CARCH/*" -type f -delete
  find . -type d -empty -delete
}

build() {
  cd ${pkgname}
  mvn package -DskipTests
}

check() {
  cd ${pkgname}
  mvn verify
}

package() {
  cd ${pkgname}/target

  install -Dm644 "${pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" \
    "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

# vim:set ts=2 sw=2 et:
