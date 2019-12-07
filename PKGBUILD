# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=gnome-firmware
pkgver=3.34.0
pkgrel=1
pkgdesc="GNOME application to update, reinstall and downgrade firmware on devices supported by fwupd"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://gitlab.gnome.org/hughsie/gnome-firmware-updater"
license=('GPL2')
depends=('gtk3' 'fwupd' 'libxmlb' 'libsoup')
makedepends=('git' 'meson' 'appstream' 'help2man')
replaces=("$pkgname-updater")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/-/+/g'
}

build() {
	arch-meson $pkgname build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
}
