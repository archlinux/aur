# Maintainer: éclairevoyant
# Contributor: ThatOneCalculator <kainoa at t1c dot dev>

_pkgname=hyprpicker
pkgname="$_pkgname-git"
pkgver=0.1.1.r2.0889bd5
pkgrel=1
pkgdesc="A wlroots-compatible Wayland color picker that does not suck"
arch=(x86_64)
url="https://github.com/hyprwm/$_pkgname"
license=(BSD)
depends=(cairo gcc-libs glibc wayland)
makedepends=(
	cmake
	gdb
	git
	libglvnd
	libjpeg-turbo
	meson
	ninja
	pango
	wayland-protocols
	wlroots
	xorgproto
)
optdepends=('wl-clipboard: --autocopy')
source=("git+$url.git")
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	make -C $_pkgname all
}

package() {
	cd $_pkgname
	install -vDm755 build/hyprpicker -t "$pkgdir/usr/bin/"
	install -vDm644 LICENSE          -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -vDm644 doc/$_pkgname.1  -t "$pkgdir/usr/share/man/man1/"
	install -vDm644 README.md        -t "$pkgdir/usr/share/doc/$_pkgname/"
}
