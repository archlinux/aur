# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=adw-gtk3-git
pkgver=1.0.r2.a2a0114
pkgrel=1
pkgdesc='The theme from libadwaita ported to GTK-3'
arch=(any)
url=https://github.com/lassekongo83/adw-gtk3
license=(LGPL2.1)
makedepends=(git meson sassc)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
