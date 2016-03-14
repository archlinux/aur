# Maintainer: Eugen Kuksa <eugenk@cs.uni-bremen.de>

pkgname=pellet
_version='2.4.0'
pkgver=20150814.bb99c19
pkgrel=2

pkgdesc="Pellet is an OWL 2 reasoner in Java"
url="http://clarkparsia.com/pellet"
license=('AGPL')
provides=('pellet')
conflicts=('pellet')
arch=('any')
makedepends=('git' 'maven')
_commit='bb99c19f9b9abf4e2c9e65098ee3e4d624e14894'
source=("${pkgname}::git+https://github.com/Complexible/pellet.git#commit=${_commit}")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd ${srcdir}/${pkgname}
  mvn clean install -DskipTests
}

package() {
  cd ${srcdir}/$pkgname

  install -d ${pkgdir}/usr/bin
  install -d ${pkgdir}/usr/lib

  cp cli/target/pelletcli/bin/pellet ${pkgdir}/usr/bin/
  cp -r cli/target/pelletcli/lib/* ${pkgdir}/usr/lib/

  chmod +x ${pkgdir}/usr/bin/pellet
}
# vim:syntax=sh
