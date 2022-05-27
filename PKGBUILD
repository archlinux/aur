# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxm-git
pkgver=0.0.41.r0.gaae2370
pkgrel=1
pkgdesc="Generic C-implementation of modular support"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxm"
license=(BSD)

depends=(
	'lib_amxc'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxm'
)
conflicts=(
	'lib_amxm'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxm.git#branch=${gitbranch}")
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
