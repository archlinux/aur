# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=mod_ba_cli-git
pkgver=0.3.5.r0.g59c6b2e
pkgrel=1
pkgdesc="Bus Agnostic Interactive Command Line Interface"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/modules/mod-ba-cli.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxt'
	'lib_amxm'
	'lib_amxp'
	'lib_amxd'
	'lib_amxb'
	'lib_amxo'
)
makedepends=(
	'git'
)
provides=(
	'mod_ba_cli'
)
conflicts=(
	'mod_ba_cli'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/amx_cli/mod-ba-cli.git#branch=${gitbranch}")
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
