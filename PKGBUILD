# Maintainer: SIMULATAN <simulatan plus aur at proton dot me>

_pkgname=hyprmag
pkgname="$_pkgname-git"
pkgver=2.0.0.r0.37b7e18
pkgrel=1
pkgdesc="A wlroots-compatible Wayland screen magnifier, based on hyprpicker"
arch=(x86_64)
url="https://github.com/SIMULATAN/$_pkgname"
license=('BSD-3-Clause')
depends=(cairo gcc-libs glibc libxkbcommon wayland)
makedepends=(
	cmake
	gdb
	git
	libglvnd
	libjpeg-turbo
	pango
	wayland-protocols
	xorgproto
)
source=("git+$url.git")
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
b2sums=('SKIP')

pkgver() {
	git -C $_pkgname describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cmake -B build -S $_pkgname
	cmake --build build
}

package() {
	install -vDm755 build/hyprmag -t "$pkgdir/usr/bin/"

	cd $_pkgname
	install -vDm644 LICENSE          -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -vDm644 doc/$_pkgname.1  -t "$pkgdir/usr/share/man/man1/"
	install -vDm644 README.md        -t "$pkgdir/usr/share/doc/$_pkgname/"
}
