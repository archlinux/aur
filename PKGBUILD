# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=augeas-git
pkgver=0.0.00001
pkgrel=1
pkgdesc="%%SOME DESCRIPTION HERE%%"
arch=('i686' 'x86_64')
url="%%SOME URL HERE%%"
license=('%%SOME LICENSE(S) HERE%%')
install=
changelog=
noextract=()
#depends=('%%RUNTIME DEPENDENCIES HERE%%')
#optdepends=('%%OPTIONAL DEPENDENCIES HERE (pkg: why needed)%%')
#makedepends=('%%BUILDTIME DEPENDENCIES HERE%%')
_pkgname=augeas
#_pkgname2='%%OPTIONAL SHORTHAND PACKAGE NAME%%'
source=("${_pkgname}::git+https://github.com/${_pkgname}/${_pkgname}.git")
sha512sums=('SKIP')
provides=("${_pkgname}")
#conflicts=("${_pkgname}")
pkgver() {
  cd "${srcdir}/${_pkgname}"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

build() {
	cd "${srcdir}/${_pkgname}/src"
	make prefix=${pkgdir}/usr
}

package() {
	install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname2} ${pkgdir}/usr/bin/${_pkgname2}
	install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
