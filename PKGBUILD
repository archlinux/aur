# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxc-git
pkgver=1.6.1.r0.g3e0fa7a
pkgrel=1
pkgdesc="Generic C-implementation of data containers"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxc"
license=(BSD)

depends=(
)
makedepends=(
	'git'
)
provides=(
	'lib_amxc'
)
conflicts=(
	'lib_amxc'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxc.git#branch=${gitbranch}")
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
