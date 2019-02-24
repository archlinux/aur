# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
# Co-Maintainer: jswenson
# Packager: Chris Knepper <chris82thekid at gmail dot com>
pkgname=android-messages-desktop
pkgver=0.9.0
pkgrel=1
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/chrisknepper/$pkgname"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libappindicator-sharp')
source=("https://github.com/chrisknepper/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.pacman"
		"https://raw.githubusercontent.com/chrisknepper/$pkgname/master/LICENSE")
sha256sums=('18300a7db40e7990a777333a9589bbbd8e2fc2d1eab64e92c6e5a45c53699fd5'
            '3a0332a1a4cbd1db232d73b032c3450c978e48759a3dbcfeddfb874e93bc0b3c')

package() {
	install -d "$pkgdir/opt/Android Messages"
	cp -a "$srcdir/opt/Android Messages/." "$pkgdir/opt/Android Messages"
    install -D -m644 $srcdir/usr/share/applications/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir=/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps
        install -d $pkgdir/$icons_dir
        install -m644 $srcdir$icons_dir/$pkgname.png $pkgdir$icons_dir/$pkgname.png
    done
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
