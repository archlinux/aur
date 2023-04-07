# Maintainer: Philip Goto <philip.goto@gmail.com>
# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>

pkgname=loupe
pkgver=44.1
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
b2sums=('284fe08be8e19cb79215e364a9db043f51b7d690f7e4e8a9ef35d68c7aca8f1b0daa3c6dbc7215768589e98dcf454277a68fe4a307bfee4c2bafc8977af26743')

prepare() {
	cd loupe-${pkgver}
	sed -i 's|4.11.1|4.10.1|g' meson.build
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

