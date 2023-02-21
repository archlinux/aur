# Maintainer: Armin Preiml <apreiml@strohwolke.at>
pkgname=harec-git
_pkgname=harec
pkgver=r1502.b84c8ba
pkgrel=1
license=("GPL3")
pkgdesc="The Hare compiler"
makedepends=("git")
depends=("qbe-git" "binutils")

arch=("x86_64" "aarch64")
url="https://harelang.org"
source=(
	"${pkgname%-*}::git+https://git.sr.ht/~sircmpwn/harec"
	0001-make-sure-eval_binarithm-vars-are-initialized.patch
)
provides=("harec")
conflicts=("harec")
# options=(debug)

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	patch --forward --strip=1 --input="${srcdir}/0001-make-sure-eval_binarithm-vars-are-initialized.patch"
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

sha256sums=('SKIP'
            '465656dcea4e98d0b4a845b11d0b6bffee8b35f89bcaf51de56211fcb8ec8793')
