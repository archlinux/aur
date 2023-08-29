# Maintainer: Valeri Ochinski <v19930312@gmail.com>

pkgname=evdevhook2-git
pkgver=1.0.0.r0.ga44b834
pkgrel=1
pkgdesc="Cemuhook UDP server for devices with modern Linux drivers"
arch=('x86_64')
url="https://github.com/v1993/evdevhook2"
license=('GPL3')
groups=()
depends=('glib2' 'zlib' 'libudev.so' 'libevdev.so' 'libgee-0.8.so')
optdepends=('upower: battery status reporting')
makedepends=('git' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('evdevhook2::git+https://github.com/v1993/evdevhook2.git')
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
