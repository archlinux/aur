pkgname="md-git"
pkgver="1.9"
pkgrel="1"
pkgdesc="Simple MarkDown Reader"

arch=("x86_64" "i686")

makedepends=("git")
depends=("gcc" "make")

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

	chown root:root ${srcdir}/md/bin/md
	chmod a+x ${srcdir}/md/bin/md

	mv "${srcdir}/md/bin/md" "${pkgdir}/usr/bin"
}
