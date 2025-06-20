# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=hare-update-git
_pkgname=hare-update
pkgver=r68.3a70a47
pkgrel=1
license=("EUPL")
pkgdesc="hare-update is a tool which assists in migrating a Hare codebases"
makedepends=(
	"git"
)

depends=(
	"qbe-git"
	"harec-git"
	"hare-git"
)

arch=("x86_64" "aarch64")
url="https://harelang.org"
source=("${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/hare-update")

provides=("hare-update")
conflicts=("hare-update")

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

check () {
	cd "$srcdir/$_pkgname"
	make check
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="/usr/lib" install
}

sha256sums=('SKIP')
