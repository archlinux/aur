# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxb-git
pkgver=4.0.2.r0.gf07ebbf
pkgrel=1
pkgdesc="Generic C-implementation for Ambiorix Backend library"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxb.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'uriparser'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxb'
)
conflicts=(
	'lib_amxb'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxb.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
	install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
