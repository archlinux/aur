# Maintainer: Mattia Borda <mattiagiovanni.borda@icloud.com>

pkgname=eyedropper-git
pkgver=0.5.1.r0.geb3c8a4
pkgrel=1
pkgdesc='A powerful color picker and formatter'
arch=(x86_64)
url=https://github.com/FineFindus/${pkgname%-git}
license=(GPL3)
depends=(libadwaita)
makedepends=(git meson rust)
checkdepends=(appstream-glib)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=(SKIP)

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
