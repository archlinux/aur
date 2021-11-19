# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=colorway-git
pkgver=r41.caf92d9
pkgrel=1
pkgdesc='Generate color pairings'
arch=(x86_64)
url=https://github.com/lainsce/colorway
license=(GPL3)
depends=(libadwaita json-glib libgee)
makedepends=(meson vala git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
