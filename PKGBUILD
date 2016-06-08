# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-baikal-unstable

_pkgname=baikal
pkgname=${_pkgname}-unstable
pkgver=0.4.5
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
