# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxo-git
pkgver=1.4.12.r0.g9bf93c2
pkgrel=1
pkgdesc="Generic C-implementation for ODL (Object Definition Language)"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxo.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxo'
)
conflicts=(
	'lib_amxo'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxo.git#branch=${gitbranch}")
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
