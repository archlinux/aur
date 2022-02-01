# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator-git
pkgver=r20.06b887f
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/${pkgname%-git}"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk3')
makedepends=('vala' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson ${pkgname%-git} build
	meson compile -C build
}

#skip check because it returns appstream-related error

package() {
	meson install -C build --destdir "$pkgdir"
}
