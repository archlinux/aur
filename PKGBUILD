# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amx_cli-git
pkgver=0.2.20.r0.gf93b99c
pkgrel=1
pkgdesc="Ambiorix Interactive Command Line Interface"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/applications/amx-cli.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxd'
	'lib_amxo'
	'lib_amxj'
	'lib_amxt'
	'lib_amxm'
)
makedepends=(
	'git'
)
provides=(
	'amx_cli'
)
conflicts=(
	'amx_cli'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amx-cli.git#branch=${gitbranch}")
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
