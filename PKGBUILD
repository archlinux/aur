# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=detwinner-git
pkgver=0.4.2.r1.g4a11b7f
pkgrel=1
pkgdesc='Duplicate file finder for the Linux desktop'
url='https://neatdecisions.com/products/detwinner-linux/'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtkmm3>=3.22' 'graphicsmagick')
makedepends=('meson' 'gtest' 'cppcheck')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+https://github.com/neatdecisions/${pkgname%-git}.git)
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
