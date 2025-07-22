# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=dulcepan-git
pkgver=v1.0.2.r2.d2620c6
pkgrel=1
pkgdesc='a Wayland screenshot tool'
arch=(x86_64)
url='https://codeberg.org/vyivel/dulcepan'
license=(GPL-3.0-only)
depends=(cairo glibc libsfdo libspng libxkbcommon pixman wayland)
makedepends=(git meson wayland-protocols)
provides=(dulcepan)
conflicts=(dulcepan)
backup=(etc/xdg/dulcepan.cfg)
source=('git+https://codeberg.org/vyivel/dulcepan.git')
sha256sums=('SKIP')

pkgver() {
	git -C dulcepan describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	arch-meson dulcepan build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
