# Maintainer: Witalij Berdinskich radio_rogal[at]keemail.me
# Contributor: Håvard Pettersson <mail@haavard.me>
# Contributor: John Trengrove <john@retrofilter.com>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Andrejs Mivreņiks <gim at fastmail dot fm>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=sqlite-jdbc
pkgver=3.42.0.0
pkgrel=2
pkgdesc='JDBC driver for SQLite'
arch=('x86_64')
url='https://github.com/xerial/sqlite-jdbc'
license=('Apache')
depends=('java-runtime>=8')
makedepends=('maven')
source=("https://github.com/xerial/sqlite-jdbc/archive/${pkgver}.tar.gz")
sha256sums=('0c93adf9725c8821eecfa9dc4cb37422a7367b3a7f2aea6db95b446aeb710bb0')

prepare() {
  # remove unused sqlite binaries
  cd ${pkgname}-${pkgver}/src/main/resources/org/sqlite/native
  find . ! -path "./Linux/$CARCH/*" -type f -delete
  find . -type d -empty -delete
}

build() {
  cd ${pkgname}-${pkgver}
  mvn package -DskipTests
}

check() {
  cd ${pkgname}-${pkgver}
  mvn verify
}

package() {
  cd ${pkgname}-${pkgver}/target

  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  ln -s "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
}

# vim:set ts=2 sw=2 et:
