pkgbase="libadvo"
pkgname="libadvo"
pkgver=1.1
pkgrel=1
pkgdesc="Advanced Output Library"

arch=("any")

makedepends=("git" "binutils" "make" "gcc")
depends=("glibc")

license=("MIT")

url="https://github.com/Noah-Arcouette/advo.git"

provides=("libadvo")
conflicts=("libadvo")

giturl="https://raw.githubusercontent.com/Noah-Arcouette/advo/master/"

source=(
	"git+${url}"
)

sha256sums=(
	"SKIP"
)


pkgver () {
	cd "advo"
	printf "${pkgver}.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "advo"

	make configure
	make build
}

package() {
	cd "advo"

	# setup dirs
	mkdir -p "${pkgdir}/usr/lib/"
	mkdir -p "${pkgdir}/usr/include/"

	# make binary root owned and executable
	chown root:root ${srcdir}/advo/bin/libadvo.a
	chmod a+x ${srcdir}/advo/bin/libadvo.a

	# copy binary
	mv "${srcdir}/advo/bin/libadvo.a" "${pkgdir}/usr/lib/libadvo.a"
	mv "${srcdir}/advo/inc/ao.h" "${pkgdir}/usr/include/advo.h"
}
