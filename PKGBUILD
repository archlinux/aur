# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxo-cg-git
pkgver=1.2.4.r0.gd0e3667
pkgrel=1
pkgdesc="ODL (Object Definition Language) Compiler/Generator"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxo-cg.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxd'
	'lib_amxo'
)
makedepends=(
	'git'
)
provides=(
	'amxo-cg'
	'amxo_cg'
)
conflicts=(
	'amxo-cg'
	'amxo_cg'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxo-cg.git#branch=${gitbranch}")
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
