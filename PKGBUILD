# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=johnny-git
_pkgname=johnny
pkgver=r527.c862833
pkgrel=3
pkgdesc="A GUI for john (the ripper, a password audit tool)"
arch=('i686' 'x86_64')
url="http://openwall.info/wiki/john/johnny"
license=('custom')
install=
changelog=
source=("git+https://github.com/shinnok/johnny.git")
noextract=()
sha512sums=('SKIP')
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

