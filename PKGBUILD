# Maintainer: Stefan Prandl (redezem) <redezem@pm.me>

_pkgname=connekt
pkgname="$_pkgname-git"
pkgver=r14.c4cb895
pkgrel=1
pkgdesc="TUI interface for rekt.network"
arch=(x86_64)
url="https://github.com/sector-f/connekt/"
license=('MIT')
depends=(
	'mpv'
	)
makedepends=(
	'go'
	)
provides=(connekt)
conflicts=(${provides[@]})
source=("$_pkgname"::"git+$url")
sha256sums=('SKIP')
pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	go build
}

package() {
	cd "$srcdir/$_pkgname"
	install -Dm555 $_pkgname -t "${pkgdir}/usr/bin/"
}

