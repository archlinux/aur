# Maintainer: Haris Gušić <harisgusic dot dev at gmail dot com>
pkgname=tuterm-git
_pkgname=tuterm
pkgver=r67.8764bf3
pkgrel=1
pkgdesc="A framework for real-time tutorials and demonstrations of CLI programs"
arch=('x86_64')
url="https://github.com/HarisGusic/tuterm"
license=('MIT')
depends=('readline')
makedepends=('git')
optdepends=('asciinema')
conflicts=('tuterm')
provides=('tuterm')
source=("git+https://github.com/veracioux/tuterm")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

_commithash() {
	git rev-parse --short HEAD
}

_version() {
	local version="$(git describe --tags --abbrev=0 | sed 's/[a-zA-Z]//g')"
	echo "$version ($(_commithash))"
}

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(_commithash)"
}

package() {
	cd "$srcdir/$_pkgname"
	make install VERSION="$(_version)" PREFIX=/usr DESTDIR="$pkgdir"
}
