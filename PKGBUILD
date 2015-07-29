# Maintainer: Brent Saner <brent (dot) saner (at) gmail (dot) com>
pkgname=johnny-git
_pkgname=johnny
pkgver=r402.2a2bfc8
pkgrel=1
pkgdesc="A GUI for john (the ripper, a password audit tool)"
arch=('i686' 'x86_64')
url="http://openwall.info/wiki/john/johnny"
license=('custom')
install=
changelog=
source=("git+https://github.com/shinnok/johnny.git")
noextract=()
md5sums=('SKIP')
depends=('john' 'qt5-base')
makedepends=('john' 'qt5-base')
provides=('johnny')
conflicts=('johnny')

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
	cd "${srcdir}/${_pkgname}"
	/usr/bin/qmake-qt5
	make
}

package() {
	#TODO: ${srcdir}/${_pkgname}/resources/icons? is this only used when building?
	install -D -m755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -D -m644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/README"
	install -D -m644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG"
	install -D -m644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}

