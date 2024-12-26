# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname="chromashift"
pkgname="$_pkgname-git"
pkgver=1.5.0.r1.g6c935de
pkgrel=1
pkgdesc="A output colorizer for your favorite commands"
arch=("x86_64")
url="https://github.com/Nadim147c/ChromaShift"
license=('GPL-3.0')
makedepends=('git' 'go')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || return
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname" || return
	make build
}

package() {
	cd "$pkgname" || return
	make install PREFIX="$pkgdir/usr"
}
