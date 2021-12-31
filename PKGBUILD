# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxd-git
pkgver=3.3.0.r0.g4da4a46
pkgrel=1
pkgdesc="Generic C-implementation for managing a data model"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxd.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxd'
)
conflicts=(
	'lib_amxd'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxd.git#branch=${gitbranch}")
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
