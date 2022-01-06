pkgname="md-git"
pkgver="1.9"
pkgrel="2"
pkgdesc="Simple MarkDown Reader"

arch=("x86_64" "i686")

makedepends=("git" "binutils" "make" "gcc")
depends=()

license=("MIT")

url="https://github.com/Noah-Arcouette/md.git"

provides=("md")

giturl="https://raw.githubusercontent.com/Noah-Arcouette/md/master/"

source=(
	"git+${url}"
)

sha256sums=(
	"SKIP"
)


pkgver () {
	cd "md"
	printf "${pkgver}.r%s%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cd "md"

	make mk
	make 
}

package() {
	cd "md"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/doc/md/"

	strip -s ${srcdir}/md/bin/md	

	chown root:root ${srcdir}/md/bin/md
	chmod a+x ${srcdir}/md/bin/md

	cp "${srcdir}/md/doc/CommandLine.md" "${pkgdir}/usr/doc/md/CommandLine.md"
	mv "${srcdir}/md/bin/md" "${pkgdir}/usr/bin"
}
