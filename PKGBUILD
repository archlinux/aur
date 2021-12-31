# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxt-git
pkgver=0.1.37.r0.ga54337a
pkgrel=1
pkgdesc="simple tty api library, adds interactive terminal interface to your applications"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxt"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxt'
)
conflicts=(
	'lib_amxt'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxt.git#branch=${gitbranch}")
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
