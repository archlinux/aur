# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>

_pkgname=baikal
pkgname=${_pkgname}-unstable
pkgver=0.3.3.r0.g01eb517
pkgrel=1
pkgdesc="Baïkal is a Calendar+Contacts server"
url="http://baikal-server.com/"
arch=('any')
license=('GPL')
depends=('php')
makedepends=('git' 'php-composer')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("${_pkgname}"::"git+https://github.com/fruux/Baikal.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  sed -i '/zip -r baikal/d' Makefile
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -d "${pkgdir}/usr/share/webapps/${_pkgname}"
  cp -dr --no-preserve=ownership "build/${_pkgname}" "${pkgdir}/usr/share/webapps/"
}
