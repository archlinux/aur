# Maintainer: éclairevoyant
# Contributor: Gabriele Musco <gabmus at disroot dot org>

_pkgname=libinput-config
pkgname="$_pkgname-git"
pkgver=r79.1d649f7
pkgrel=1
pkgdesc="Configuration system for libinput"
arch=(x86_64)
url="https://gitlab.com/warningnonpotablewater/$_pkgname"
license=(ISC)
depends=(glibc libinput)
makedepends=(git meson)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson -Dnon_glibc=true $_pkgname build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
}

