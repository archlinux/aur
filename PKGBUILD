# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=harec-git
_pkgname=harec
pkgver=r1828.770566a
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
	cp configs/linux.mk config.mk
	make ARCH=$CARCH
}

check () {
	cd "$srcdir/$_pkgname"
	make ARCH=$CARCH check
}


package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir" install
}

