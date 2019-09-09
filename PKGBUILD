# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: jswenson
# Packager: Chris Knepper <chris82thekid at gmail dot com>
pkgname=android-messages-desktop
pkgver=3.0.0
pkgrel=2
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/chrisknepper/android-messages-desktop"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 
         'libappindicator-sharp')
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.pacman"
		"https://raw.githubusercontent.com/chrisknepper/$pkgname/master/LICENSE"
		"$pkgname")
sha256sums=('a9512d6f0bc918a370a8e6ab9691ea91d3e33e0aea54ea6e65d500e1c63fef3d'
            '3a0332a1a4cbd1db232d73b032c3450c978e48759a3dbcfeddfb874e93bc0b3c'
            '006d50c067e21c9978890a2e8f27b86ba121e48992ef6814864188d704fca860')

package() {
	install -d "$pkgdir/usr/lib/$pkgname"
	cp -a "opt/Android Messages/resources/." "$pkgdir/usr/lib/$pkgname/"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	sed -i 's|"/opt/Android Messages/android-messages-desktop" %U|android-messages-desktop|g' \
		"usr/share/applications/$pkgname.desktop"
	install -Dm644 "usr/share/applications/$pkgname.desktop" \
		"$pkgdir/usr/share/applications/$pkgname.desktop"
	for icon_size in 16 24 32 48 64 128 256 512 1024; do
		icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
		install -d $pkgdir/$icons_dir
		install -m644 $srcdir$icons_dir/$pkgname.png $pkgdir$icons_dir/$pkgname.png
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
