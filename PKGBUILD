# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxb-inspect-git
pkgver=1.2.0.r0.gc244343
pkgrel=1
pkgdesc="Ambiorix Backend inspector/validation tool"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxb-inspect.git"
license=(BSD)

depends=(
	'lib_amxb'
)
makedepends=(
	'git'
)
provides=(
	'amxb-inspect'
)
conflicts=(
	'amxb-inspect'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxb-inspect.git#branch=${gitbranch}")
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
