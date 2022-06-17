# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxrt-git
pkgver=1.5.2.r0.g942f317
pkgrel=1
pkgdesc="Ambiorix application runtime"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxrt.git"
license=(BSD)

depends=(
	'libevent'
	'lib_amxc'
	'lib_amxp'
	'lib_amxd'
	'lib_amxb'
	'lib_amxo'
)
makedepends=(
	'git'
)
provides=(
	'amxrt'
)
conflicts=(
	'amxrt'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxrt.git#branch=${gitbranch}")
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
