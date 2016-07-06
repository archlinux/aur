# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
pkgname=felony-git
pkgver=r247.4b7c1cf
pkgrel=1
pkgdesc="An open-source pgp keychain built on the modern web with Electron, React, and Redux"
arch=('i686' 'x86_64')
url="https://github.com/henryboldi/felony"
license=('MIT')
install=
changelog=
noextract=()
depends=('npm' 'npm-cross-env')
#optdepends=('%%OPTIONAL DEPENDENCIES HERE (pkg: why needed)%%')
#makedepends=('%%BUILDTIME DEPENDENCIES HERE%%')
_pkgname=felony
#_pkgname2='%%OPTIONAL SHORTHAND PACKAGE NAME%%'
source=("${_pkgname}::git+https://github.com/henryboldi/felony.git")
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

package() {

	cd "$srcdir"
	local _npmdir="${pkgdir}/usr/lib/node_modules/"
	mkdir -p "${_npmdir}"
	cd "${_npmdir}"
	npm install -g --prefix "${pkgdir}/usr" ${_pkgname}@${_npmver}

}
