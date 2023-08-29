# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=linuxmotehook2-git
pkgver=0.1.5.r8.gc06e200
pkgrel=2
pkgdesc="Cemuhook UDP server for WiiMotes on Linux"
arch=('x86_64')
url="https://github.com/v1993/linuxmotehook2"
license=('GPL3')
groups=()
depends=('glib2' 'zlib' 'libudev.so' 'libgee-0.8.so')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('linuxmotehook2::git+https://github.com/v1993/linuxmotehook2.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	meson subprojects download --sourcedir="$srcdir/${pkgname%-git}"
}

build() {
	arch-meson "$srcdir/${pkgname%-git}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
