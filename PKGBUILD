# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=libipuz-git
pkgver=r173.f2b6fff
pkgrel=1
pkgdesc='Library for parsing .ipuz puzzle files'
arch=(x86_64)
url=https://gitlab.gnome.org/jrb/libipuz
license=(LGPL)
makedepends=(meson git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
md5sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname%-git}" build
  meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
