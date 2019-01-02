# Maintainer Cookie Engineer <@cookiengineer>

pkgname=transmission-remote-gnome-git
pkgver=r1.9f070d6
pkgrel=1
pkgdesc="Remote client for Transmission for GNOME"
arch=(any)
url=https://github.com/tingping/transmission-remote-gnome
license=('GPL3')
depends=('python' 'python-gobject' 'glib2' 'gtk3' 'libsoup')
optdepends=('statusnotifier')
makedepends=('appstream-glib' 'meson' 'ninja')
options=('!emptydirs')
source=('git+https://github.com/tingping/transmission-remote-gnome')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/transmission-remote-gnome";
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)";
}

build() {
	arch-meson "$srcdir/transmission-remote-gnome" build \
		-Dudev-dir=/usr/lib/udev \
		-Dtests=false \
		-Ddocumentation=false;
	ninja -C build;
}

package() {
	DESTDIR="$pkgdir" ninja -C build install;
}

