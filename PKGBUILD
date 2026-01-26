# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=flatpost-bin
pkgver=1.2.0
_fedora=43
pkgrel=1
pkgdesc="Desktop Environment agnostic flatpak-only shop gui"
arch=(any)
url="https://github.com/GloriousEggroll/flatpost"
license=('BSD-2-Clause AND GPL-3.0-or-later')
depends=('gdk-pixbuf2' 'gtk3' 'glib2' 'flatpak' 'hicolor-icon-theme' 'python-dbus' 'python-gobject' 'python-requests' 'python' 'appstream' 'xorg-xhost')
provides=(${pkgname::-4})
conflicts=(${pkgname::-4})
source=("$url/releases/download/$pkgver/flatpost-$pkgver.fc${_fedora}.rpm")
sha256sums=('eac72c87dd9bfa15a1c1d084426a3b498e4e9338be2e8ee1d16014854f00a9ad')
validpgpkeys=()

package() {
	cd "$srcdir"
	cp -a --no-preserve=ownership usr "$pkgdir"
	install -Dm644 "$pkgdir/usr/share/icons/hicolor/64x64/apps/com.flatpost.flatpostapp.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.flatpost.flatpostapp.svg"
	rm -rf "$pkgdir/usr/share/icons/hicolor/64x64"
	sed -i 's/64x64\/apps/scalable\/apps/g' "$pkgdir/usr/bin/${pkgname::-4}"
	mv "$pkgdir/usr/share/licenses/${pkgname::-4}" "$pkgdir/usr/share/licenses/$pkgname"
}
