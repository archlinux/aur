# Maintainer: hhhhhhhhhn <hhhhhhhhhn@protonmail.com>
pkgname="austral-git"
pkgver=v0.2.0.r3.gd8ccef5
pkgrel=2
pkgdesc="Systems language with linear types and capability-based security."
arch=("x86_64")
url="https://github.com/austral/austral"
license=("Apache")
conflicts=("austral")
provides=("austral")
depends=("gmp" "glibc")
makedepends=("opam" "ocaml" "make" "dune" "git")
source=("git+${url}.git")
sha256sums=(SKIP)

build() {
	opam switch remove austral -y || true
	cd "austral"
	opam switch create austral 4.13.0
	eval $(opam env --switch=austral)
	opam install --deps-only -y .
	make
	opam switch remove austral -y
}

package() {
	cd "austral"
	install -Dm 755 ./austral "$pkgdir/usr/bin/austral"
}

pkgver() {
	cd "austral"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
