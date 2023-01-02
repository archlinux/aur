# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=pods-git
pkgver=r1868.5964e81
pkgrel=1
pkgdesc='A Podman desktop application'
arch=(x86_64)
url=https://github.com/marhkb/pods
license=(GPL3)
depends=(gtk4 libadwaita podman gtksourceview5 libpanel vte4)
makedepends=(git meson rust)
checkdepends=(appstream-glib)
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
