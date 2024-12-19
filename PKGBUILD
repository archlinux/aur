# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname="waytune"
pkgname="$_pkgname-git"
pkgver=r14.1cf6c02
pkgrel=2
pkgdesc="A collection of custom waybar module"
arch=("x86_64")
url="https://github.com/Nadim147c/WayTune"
license=('AGPL')
makedepends=('git' 'go')
optdepends=("wireplumber: control volume in pipewire module")
provides=("waytune")
conflicts=("waytune")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname" || return
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$pkgname" || return
	make build
}

package() {
	cd "$pkgname" || return
	make install PREFIX="$pkgdir/usr"
}
