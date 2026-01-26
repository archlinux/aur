# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: dragoneki <dragoneki@protonmail.com>
pkgname=flatpost
pkgver=1.2.0
pkgrel=1
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=('any')
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('flatpak' 'python-requests' 'python-dbus' 'hicolor-icon-theme' 'gtk3' 'appstream' 'gdk-pixbuf2' 'python' 'glib2' 'python-gobject' 'xorg-xhost')
makedepends=('python')
source=("$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('07546fd1c41b3827f7f0b682b826ed8b5baba906f82fd0a9c65165ff046fb508')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" make install
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.flatpost.flatpostapp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flatpost.flatpostapp.svg"
	rm -rf "$pkgdir/usr/share/icons/hicolor/1024x1024"
	rm -rf "$pkgdir/usr/share/icons/hicolor/64x64"
	sed -i 's/64x64\/apps/scalable\/apps/g' "$pkgdir/usr/bin/${pkgname}"
}
