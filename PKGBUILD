# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=fixtar-git
pkgver=r4.87bb44a
pkgrel=2
pkgdesc="SOME DESCRIPTION HERE"
arch=('i686' 'x86_64')
url="https://github.com/BestSolution-at/fixtar"
license=('GPL2')
install=
changelog=
noextract=()
#depends=('')
#optdepends=('')
makedepends=('flex')
_pkgname=${pkgname%-git}
_pkgname2=ft
source=("${_pkgname}::git+https://github.com/BestSolution-at/${_pkgname}.git")
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

sha512sums=('SKIP')

build() {
	cd "${srcdir}/${_pkgname}/src"
	make prefix=${pkgdir}/usr
}

package() {
	install -D -m755 ${srcdir}/${_pkgname}/src/${_pkgname2} ${pkgdir}/usr/bin/${_pkgname2}
	install -D -m644 ${srcdir}/${_pkgname}/docs/README.html.en ${pkgdir}/usr/share/doc/${_pkgname}/README.html
}
