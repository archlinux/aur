# Maintainer: Philip Goto <philip.goto@gmail.com>
# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=loupe
pkgver=0.0.0+r300+d08b107
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
_commit=('d08b10764003c97f579e4c82a49e15037811bfcb')
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

