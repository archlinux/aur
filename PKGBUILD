# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance-git
pkgver=1.5.4.r1.gf953f8f
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/${pkgname%-git}
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('git' 'meson' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd ${pkgname%-git}
	cargo update
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
