# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=eyedropper-git
pkgver=0.4.0.r0.g5272841
pkgrel=1
pkgdesc='A simple to use color picker and editor'
arch=(x86_64)
url=https://github.com/FineFindus/${pkgname%-git}
license=(GPL3)
depends=('gtk4' 'libadwaita')
makedepends=('git' 'meson' 'rust')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
