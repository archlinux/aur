# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=furtherance-git
pkgver=1.0.8.r8.g1ff89ff
pkgrel=1
pkgdesc='Track your time without being tracked'
arch=(x86_64)
url=https://github.com/lakoliu/Furtherance
license=(GPL3)
depends=('gtk4' 'libadwaita' 'sqlite')
makedepends=('git' 'meson' 'rust')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd Furtherance
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson Furtherance build
	meson compile -C build
}

package() {
	DESTDIR="${pkgdir}" meson install -C build
}
