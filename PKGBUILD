_pkgname=amber-bash
pkgname="${_pkgname}-git"
pkgver=r447.abfb15f
pkgrel=1
pkgdesc="The programming language compiled to bash"
url="https://amber-lang.com/"
makedepends=('cargo' 'rust')
arch=('any')
license=('GPL3')
provides=('amber-bash')
conflicts=('amber-bash')

source=("${_pkgname}::git+https://github.com/amber-lang/amber")
sha256sums=(SKIP)

build() {
	cd "${srcdir}/${_pkgname}"
	cargo b -r
}

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	cd "$srcdir/${_pkgname}/target/release"
	install -Dm755 amber "$pkgdir/usr/bin/amber"
}

