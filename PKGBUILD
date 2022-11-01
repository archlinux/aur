pkgbase="chd-git"
pkgname="chd-git"
pkgver=1.5
pkgrel=89
pkgdesc="C makefile generator"

arch=("any")

makedepends=("git" "make" "gcc" "binutils")
depends=("glibc")

license=("Mimik1.2")

url="https://github.com/Noah-Arcouette/hd.git"

provides=()
conflicts=("hd-git")

giturl="https://raw.githubusercontent.com/Noah-Arcouette/hd/master/"

source=(
	"git+${url}"
)

sha256sums=(
	"SKIP"
)

build () {
	cd "hd"

	mkdir ./obj -p
	mkdir ./bin -p

	./mkinfo 1.5

	make -j1 build
}

package() {
	cd "hd"

	# setup dirs
	mkdir -p "${pkgdir}/usr/bin/"

	# make binary root owned and executable
	chown root:root ${srcdir}/hd/bin/hd
	chmod a+x ${srcdir}/hd/bin/hd

	# copy binary
	mv "${srcdir}/hd/bin/hd" "${pkgdir}/usr/bin/hd"
}
