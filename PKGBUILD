# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=compiano-git
pkgver=r156.2b9895f
pkgrel=1
pkgdesc="a midi controllable software musical instrument"
arch=('x86_64')
url="https://gitlab.gnome.org/hub/compiano.git"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'alsa-lib' 'libgit2')
makedepends=('git' 'ninja' 'meson' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	meson --prefix=/usr "." "build"
	meson compile -C "build"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	meson install -C "build" --destdir "$pkgdir"
}
