# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb_pcb-git
pkgver=2.1.4.r0.g5c6b8a8
pkgrel=1
pkgdesc="PCB baapi back-end"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_pcb.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'libpcb'
)
makedepends=(
	'git'
)
provides=(
	'amxb_pcb'
)
conflicts=(
	'amxb_pcb'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/amxb_backends/amxb_pcb.git#branch=${gitbranch}")
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
