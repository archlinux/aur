# Maintainer: Slips slipfox(underscore)xyz(at)riseup(dot)net
_pkgname=pow
pkgname=${_pkgname}-git
pkgver=r52.d9e1541
pkgrel=1
pkgdesc="A lightning fast AUR search utility written in C."
arch=('i386' 'x86_64')
url="https://git.slipfox.xyz/Slips/pow"
license=('GPL3')
groups=()
depends=('json-c')
makedepends=('git' 'scdoc' 'tcc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=()
backup=()
options=()
install=
source=("${_pkgname}::git+${url}.git")
noextract=()
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	cc pow.c -O3 -std=c99 -Wall -Wpedantic -Werror -ljson-c -o pow
	scdoc < pow.1.scd > pow.1
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 pow ${pkgdir}/usr/bin/pow
	install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -Dm644 pow.1 ${pkgdir}/usr/share/man/man1/pow.1
}
