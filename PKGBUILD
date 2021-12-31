# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=mod_sahtrace-git
pkgver=0.0.9.r1.ged1ec2e
pkgrel=1
pkgdesc="Ambiorix module for sahtrace"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/modules/mod-sahtrace.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxp'
	'lib_amxo'
	'libsahtrace'
)
makedepends=(
	'git'
)
provides=(
	'mod_sahtrace'
)
conflicts=(
	'mod_sahtrace'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/modules/mod-sahtrace.git#branch=${gitbranch}")
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
