# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost-bin
pkgver=1.1.1
_fedora=42
pkgrel=2
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=(any)
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'gtk3' 'glib2' 'flatpak' 'hicolor-icon-theme' 'python-dbus' 'python-gobject' 'python-requests' 'python' 'appstream' 'xorg-xhost')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/$pkgver/flatpost-$pkgver.fc${_fedora}.rpm")
sha256sums=('28a583a9cf61def49d46eeea14c9d7223c710a59936445b20c4a10190576ed24')
validpgpkeys=()

package() {
	cd "$srcdir"
	cp -a --no-preserve=ownership usr "$pkgdir"
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.flatpost.flatpostapp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flatpost.flatpostapp.svg"
	rm -rf "$pkgdir/usr/share/icons/hicolor/64x64"
	sed -i 's/64x64\/apps/scalable\/apps/g' "$pkgdir/usr/bin/${pkgname::-4}"
}
