# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: dragoneki <dragoneki@protonmail.com>
pkgname=flatpost
pkgver=1.1.1
pkgrel=3
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=('any')
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('flatpak' 'python-requests' 'python-dbus' 'hicolor-icon-theme' 'gtk3' 'appstream' 'gdk-pixbuf2' 'python' 'glib2' 'python-gobject' 'xorg-xhost')
makedepends=('python')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('32b15cd3d2995cdd0f3ede3db1f70cd30fae19b2da9d3a5aaa1ba986a5b64f90')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.flatpost.flatpostapp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flatpost.flatpostapp.svg"
	rm -rf "$pkgdir/usr/share/icons/hicolor/1024x1024"
	rm -rf "$pkgdir/usr/share/icons/hicolor/64x64"
	sed -i 's/64x64\/apps/scalable\/apps/g' "$pkgdir/usr/bin/${pkgname}"
}
