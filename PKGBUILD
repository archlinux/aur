# Maintainer: Charlton Moren <charlton.moren@gmail.com>
pkgname=skyrim-cursor-theme
pkgver=1.0
pkgrel=1
pkgdesc="Skyrim — X11/Wayland cursor theme by ru5tyshark"
arch=('any')
url="https://www.gnome-look.org/p/1369496"
license=('custom')
source=("$pkgname-$pkgver.tar.bz2::https://github.com/veasman/kara-cursor-mirror/releases/download/v1/Skyrim-by-ru5tyshark-cursors.tar.bz2")
sha256sums=('b3cc8295b3a9579ef3102a2fb95a5a4c38e9a52ac100ba30b274add07d30f9fc')

package() {
	install -dm755 "$pkgdir/usr/share/icons"
	# Upstream ships the theme under "Skyrim-by-ru5tyshark-cursors/". Rename
	# to "Skyrim" on install so gtk-cursor-theme-name / XCURSOR_THEME can
	# reference the short form. Upstream also bundles alternate hand-*.tar.bz2
	# variants at the top level — leave those out of the install; users who
	# want them can grab the archive from gnome-look.
	cp -r "$srcdir/Skyrim-by-ru5tyshark-cursors" "$pkgdir/usr/share/icons/Skyrim"
	# Strip non-theme extras shipped in the tarball root.
	rm -f "$pkgdir/usr/share/icons/Skyrim"/*.tar.bz2 \
	      "$pkgdir/usr/share/icons/Skyrim"/*.png \
	      "$pkgdir/usr/share/icons/Skyrim"/*.desktop
	chmod -R u=rwX,go=rX "$pkgdir/usr/share/icons/Skyrim"
}
