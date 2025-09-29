# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost-git
pkgver=1.1.1.r0.gae844b9
pkgrel=2
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=('any')
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('flatpak' 'python-requests' 'python-dbus' 'hicolor-icon-theme' 'gtk3' 'appstream' 'gdk-pixbuf2' 'python' 'glib2' 'python-gobject' 'xorg-xhost')
makedepends=('git' 'python')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" make install
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.flatpost.flatpostapp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flatpost.flatpostapp.svg"
	rm -rf "$pkgdir/usr/share/icons/hicolor/64x64" "$pkgdir/usr/share/icons/hicolor/1024x1024"
	sed -i 's/64x64\/apps/scalable\/apps/g' "$pkgdir/usr/bin/${pkgname::-4}"
}
