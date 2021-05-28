# Maintainer: Antonín Dach <dach@protonmail.com>

pkgname=lisgd-git
_pkgname=lisgd
pkgver=0.3.0.r2.g190a93d
pkgrel=2
pkgdesc='Bind gestures on touchscreens, and unsupported gesture devices via libinput touch events'
arch=(any)
url='https://git.sr.ht/~mil/lisgd'
license=('MIT')
makedepends=('git')
depends=(libinput)
provides=(lisgd)
conflicts=()
install=
source=('git+https://git.sr.ht/~mil/lisgd#branch=master')
sha1sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	( set -o pipefail
	  git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/bin"
	install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

