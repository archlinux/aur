# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=dynamic-wallpaper-git
pkgver=0.0.1.r2.g20101d1
pkgrel=2
pkgdesc='Dynamic wallpaper maker for Gnome 42'
url='https://github.com/dusansimic/dynamic-wallpaper'
arch=('any')
license=('GPL2')
depends=('gtk4' 'libadwaita' 'python3')
makedepends=('meson' 'git')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
