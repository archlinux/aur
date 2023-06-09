# Maintainer: xkww3n <xkww3n at outlook dot com>
pkgname=spectre-cli-git
pkgver=2.6_cli_5_116_g26c01a5
pkgrel=1
pkgdesc="The command-line interface brings the Spectre algorithm to POSIX platforms, including Linux, *NIX, macOS and Windows."
arch=('any')
url="https://spectre.app/"
license=('GPL3')
depends=('ncurses' 'json-c' 'libsodium')
makedepends=('git')
checkdepends=('jq')
provides=('spectre')
conflicts=('spectre')
source=("${pkgname}::git+https://gitlab.com/spectre.app/cli.git")

md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "$(git describe --match '*-cli*' --long --dirty | sed "s/-/_/g")"
}

prepare() {
	cd "$srcdir/${pkgname}"

	git submodule init
	git submodule update
}

build() {
	cd "$srcdir/${pkgname}"

	targets='spectre spectre-tests' ./build
}

check() {
	cd "$srcdir/${pkgname}"

	./spectre-cli-tests
	./spectre-tests
}

package() {
	cd "$srcdir/${pkgname}"

	install -Dm555 spectre "${pkgdir}/usr/bin/spectre"
}
