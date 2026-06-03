# Maintainer: Capricornus007 <Capricornus007 at proton dot me>
# Co-Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-backgrounds-git
pkgver=50.0.r3.g95f4178
pkgrel=1
pkgdesc='Background images and data for GNOME'
url='https://gitlab.gnome.org/GNOME/gnome-backgrounds'
arch=(any)
depends=(webp-pixbuf-loader)
makedepends=(git glib2 meson)
provides=(gnome-backgrounds)
conflicts=(gnome-backgrounds)
license=(CCPL:by-sa)
source=('git+https://gitlab.gnome.org/GNOME/gnome-backgrounds.git')
b2sums=('SKIP')

pkgver() {
	cd gnome-backgrounds
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson gnome-backgrounds build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
