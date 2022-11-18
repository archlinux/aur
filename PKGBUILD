# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=text-engine-git
pkgver=0.1.1.r142.g7c448f0
pkgrel=1
pkgdesc="A lightweight rich-text framework for GTK"
arch=('x86_64' 'aarch64')
url="https://github.com/mjakeman/${pkgname%-git}"
license=('LGPL3')
depends=('json-glib' 'libxml2' 'libadwaita')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
