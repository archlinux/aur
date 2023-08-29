# Maintainer : Zubarev Grigoriy <thirtysix@thirtysix.pw>

pkgname=pblocks-git
_pkgname="${pkgname%-git}"
pkgver=1.3.r34.0d8dc63
pkgrel=1
pkgdesc="Modular status bar for dwm and other wm's written in POSIX shell"
url="https://codeberg.org/thirtysixpw/$_pkgname"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('xorg-xsetroot')
optdepends=('xorg-xprop: update dwm bar without xsetroot')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	printf "%s.r%s.%s\\n" "$(awk '/^VERSION =/ {print $3}' Makefile)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ts=4 sw=4 noet ft=PKGBUILD
