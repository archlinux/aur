# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=amxo_xml_to-git
pkgver=0.2.4.r0.g5bbb6ba
pkgrel=1
pkgdesc="Ambiorix XML converter"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/ambiorix/applications/amxo-xml-to.git"
license=(BSD)

depends=(
	'lib_amxc'
	'lib_amxj'
	'libxslt'
)
makedepends=(
	'git'
)
provides=(
	'amxo_xml_to'
)
conflicts=(
	'amxo_xml_to'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/ambiorix/applications/amxo-xml-to.git#branch=${gitbranch}")
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
