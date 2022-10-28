# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=harec-git
_pkgname=harec
pkgver=r1382.ef3e7d0
pkgrel=1
license=("GPL3")
pkgdesc="The Hare compiler"
makedepends=("git")
depends=("qbe-git" "binutils")

arch=("x86_64" "aarch64")
url="https://harelang.org"
source=("${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/harec")
sha512sums=('SKIP')
provides=("harec")
conflicts=("harec")
# options=(debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	./configure --prefix=/usr
	make
}

check () {
	cd "$srcdir/$_pkgname"
	make check
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

