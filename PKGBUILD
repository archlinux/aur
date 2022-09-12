# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=settings-shim-git
pkgver=r22.c76e5ee
pkgrel=1
pkgdesc='Simple shim to launch GNOME Control Center from the settings spec'
arch=(x86_64)
url=https://github.com/dusansimic/settings-shim
license=(GPL3)
depends=(gnome-control-center gtk4)
makedepends=(git meson vala)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
