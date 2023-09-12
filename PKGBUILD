# Maintainer: Stefan Auditor <stefan.auditor@erdfisch.de>
# Please report issues at https://github.com/sanduhrs/arch-aur-baikal-git

_pkgname=baikal
pkgname=${_pkgname}-git
pkgver=r897.31e7d54
pkgrel=1
pkgdesc="Baïkal is a Calendar+Contacts server"
url="https://sabre.io/baikal/"
arch=('any')
license=('GPL')
depends=('php')
makedepends=('git' 'composer')
optdepends=('sqlite: Database' 'mariadb: Alternate database' 'php-sqlite: To use the sqlite backend')
source=("${_pkgname}"::"git+https://github.com/fruux/Baikal.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
