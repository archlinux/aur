# Maintainer: Philip Goto <philip.goto@gmail.com>
# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=loupe
pkgver=0.0.0+r297+6d694c6
pkgrel=1
pkgdesc='Simple image viewer for GNOME'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/Incubator/loupe'
license=(GPL)
depends=(
	gtk4
	libadwaita
	libgweather-4
	libheif
)
makedepends=(
	git
	itstool
	meson
	rust
)
_commit=('6d694c6bebb71654e897fd18a220150cac30dfd6')
source=("git+${url}.git#commit=${_commit}")
b2sums=('SKIP')

pkgver() {
	cd loupe
	printf "0.0.0+r%s+%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson loupe build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	meson install -C build --destdir "${pkgdir}"
}

