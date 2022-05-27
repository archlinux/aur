# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=lib_amxj-git
pkgver=0.3.40.r0.g410d743
pkgrel=1
pkgdesc="JSON Reader/generation - JSON string variant"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/libraries/libamxj.git"
license=(BSD)

depends=(
	'lib_amxc'
	'yajl'
)
makedepends=(
	'git'
)
provides=(
	'lib_amxj'
)
conflicts=(
	'lib_amxj'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/libraries/libamxj.git#branch=${gitbranch}")
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
