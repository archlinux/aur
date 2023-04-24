# Maintainer: Philip Goto <philip.goto@gmail.com>
# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=loupe
pkgver=44.2
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
source=("${url}/-/archive/${pkgver}/loupe-${pkgver}.tar.gz")
b2sums=('7717fb2e55c66ce666528e3db9233fc6703cfe3537c000fd8fccef0e627da39cabcee96b4c91094d6c142f70f5dd9eea8895d78a73a60b7fd70f1406fe9c425f')

prepare() {
	cd loupe-${pkgver}
	sed -i 's|4.11.1|4.10.3|g' meson.build
}

build() {
	arch-meson loupe-${pkgver} build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	meson install -C build --destdir "${pkgdir}"
}

