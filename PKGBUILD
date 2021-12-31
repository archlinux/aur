# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=mod_dmext-git
pkgver=0.3.0.r0.g8873802
pkgrel=1
pkgdesc="Module Data Model Extension"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/modules/mod-dmext.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxo'
	'lib_amxd'
)
makedepends=(
	'git'
)
provides=(
	'mod_dmext'
)
conflicts=(
	'mod_dmext'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/mod-dmext.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	export CFLAGS="${CFLAGS} -I$(realpath ../include)"
	make
}

package() {
	cd "${pkgname}"
	make DEST="${pkgdir}/" LIBDIR="/usr/lib" install
	install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
